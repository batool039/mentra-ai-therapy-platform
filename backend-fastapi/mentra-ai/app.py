from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI
from services.grouping import get_group_by_id
from services.therapist_handoff import generate_group_brief

from pydantic import BaseModel

from services.analysis import analyze_text
from services.grouping import assign_group
from services.therapist_handoff import generate_handoff

app = FastAPI(title="Mentra AI Backend")
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # hackathon demo
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class AnalyzeRequest(BaseModel):
    user_id: str
    conversation_text: str

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/analyze-user")
def analyze_user(req: AnalyzeRequest):
    insights = analyze_text(req.conversation_text)
    group = assign_group(req.user_id, insights)
    handoff = generate_handoff(group, insights, req.user_id)
@app.get("/group/{group_id}/brief")
def group_brief(group_id: str):
    group = get_group_by_id(group_id)
    return generate_group_brief(group)
@app.post("/schedule")
def schedule(data: dict):
    # Prototype scheduling: return a best time slot
    group_id = data.get("group_id", "UNKNOWN_GROUP")
    return {
        "group_id": group_id,
        "suggested_time": "Saturday 6:00 PM",
        "status": "Scheduled (prototype)"
    }

@app.post("/pay")
def pay(data: dict):
    # Prototype payment: always returns success
    user_id = data.get("user_id", "UNKNOWN_USER")
    amount = data.get("amount", 10)
    return {
        "user_id": user_id,
        "amount": amount,
        "currency": "AED",
        "status": "Payment Success (sandbox)"
    }

    return {
        "user_id": req.user_id,
        "analysis": insights,
        "assigned_group": group["group_id"],
        "group_type": group["type"],
        "therapist_handoff": handoff
    }

