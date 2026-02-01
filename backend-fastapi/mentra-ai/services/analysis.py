import os
import json
from dotenv import load_dotenv

load_dotenv()

def _mock_analyze(text: str) -> dict:
    t = text.lower()
    if any(w in t for w in ["work", "office", "boss", "meeting", "deadline"]):
        category = "Workplace Stress"
        keywords = ["work", "meetings", "pressure", "stress"]
    elif any(w in t for w in ["relationship", "breakup", "partner", "family"]):
        category = "Relationship Issues"
        keywords = ["relationship", "conflict", "communication", "emotions"]
    else:
        category = "Anxiety Management"
        keywords = ["anxiety", "worry", "panic", "sleep"]

    severity = "Medium"
    if any(w in t for w in ["can't breathe", "panic", "severe", "terrible", "hopeless"]):
        severity = "High"
    if any(w in t for w in ["a little", "mild", "sometimes"]):
        severity = "Low"

    return {
        "category": category,
        "severity": severity,
        "keywords": keywords,
        "notes": "Demo categorization (non-diagnostic)."
    }

def analyze_text(text: str) -> dict:
    """
    Uses OpenAI if OPENAI_API_KEY is present, otherwise uses mock analysis.
    Returns dict: category, severity, keywords, notes
    """
    api_key = os.getenv("OPENAI_API_KEY", "").strip()
    if not api_key:
        return _mock_analyze(text)

    # OpenAI path (new SDK)
    from openai import OpenAI
    client = OpenAI(api_key=api_key)

    prompt = f"""
You are helping categorize a user's concern for group therapy matching.
Do NOT diagnose. Only categorize.

Return ONLY valid JSON with keys:
category, severity, keywords, notes

Severity must be one of: Low, Medium, High
keywords must be an array of 4-6 short keywords.

User text:
{text}
"""

    resp = client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[{"role": "user", "content": prompt}],
        temperature=0.2,
    )

    content = resp.choices[0].message.content.strip()

    # Parse JSON safely
    try:
        return json.loads(content)
    except Exception:
        start = content.find("{")
        end = content.rfind("}")
        if start != -1 and end != -1:
            return json.loads(content[start:end+1])

        return _mock_analyze(text)
