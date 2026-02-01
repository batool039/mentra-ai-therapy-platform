def generate_handoff(group: dict, insights: dict, user_id: str) -> dict:
    return {
        "group_id": group["group_id"],
        "group_type": group["type"],
        "member_count": len(group["users"]),
        "common_themes": [
            f"Concerns related to {group['type']}",
            "Shared stress triggers and coping patterns",
            "Peer support and normalization"
        ],
        "individual_snapshot": {
            "user_id": user_id,
            "severity": insights.get("severity"),
            "keywords": insights.get("keywords"),
            "notes": insights.get("notes"),
        },
        "session_plan": [
            "Opening check-in (1 min each)",
            "Theme discussion + reflection",
            "Skill practice (breathing / reframing)",
            "Wrap-up + take-home coping strategy"
        ],
        "logistics": {
            "suggested_time": group.get("suggested_time"),
            "payment_status": group.get("payment_status"),
        },
        "safety_note": "This is a demo categorization system and does not diagnose. Escalate if user indicates self-harm risk."
    }
def generate_group_brief(group: dict) -> dict:
    if "error" in group:
        return group

    return {
        "group_id": group["group_id"],
        "group_type": group["type"],
        "members": group["users"],
        "key_themes": [
            f"Primary focus: {group['type']}",
            "Shared triggers and coping patterns",
            "Peer validation + support"
        ],
        "session_agenda": [
            "Confidentiality + group rules (2 min)",
            "Quick check-in (1 min each)",
            "Theme discussion (10 min)",
            "Skill practice: breathing/reframing (10 min)",
            "Wrap-up + take-home plan (3 min)"
        ],
        "logistics": {
            "suggested_time": group.get("suggested_time", "Saturday 6:00 PM"),
            "payment_status": group.get("payment_status", "Sandbox Success")
        }
    }
