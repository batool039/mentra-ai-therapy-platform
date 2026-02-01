import json
from pathlib import Path

GROUPS_FILE = Path("data/groups.json")

def _load_groups():
    if not GROUPS_FILE.exists():
        GROUPS_FILE.write_text("[]")
    raw = GROUPS_FILE.read_text().strip()
    return json.loads(raw) if raw else []

def _save_groups(groups):
    GROUPS_FILE.write_text(json.dumps(groups, indent=2))

def assign_group(user_id: str, insights: dict) -> dict:
    """
    Rule-based grouping:
    - 3 group types
    - max 5 users per group
    - creates new group if full/not found
    """
    cat = (insights.get("category") or "").lower()
    kws = " ".join(insights.get("keywords") or []).lower()
    text = f"{cat} {kws}"

    if any(k in text for k in ["work", "office", "boss", "meeting", "deadline"]):
        group_type = "Workplace Stress"
    elif any(k in text for k in ["relationship", "partner", "breakup", "family"]):
        group_type = "Relationship Issues"
    else:
        group_type = "Anxiety Management"

    groups = _load_groups()

    # add to existing group if space
    for g in groups:
        if g["type"] == group_type and len(g["users"]) < 5:
            if user_id not in g["users"]:
                g["users"].append(user_id)
                _save_groups(groups)
            return g

    # else create a new group
    new_group = {
        "group_id": f"G_{group_type.upper().replace(' ', '_')}_{len(groups) + 1}",
        "type": group_type,
        "users": [user_id],
        "suggested_time": "Saturday 6:00 PM",
        "payment_status": "Sandbox Success"
    }
    groups.append(new_group)
    _save_groups(groups)
    return new_group
def get_group_by_id(group_id: str) -> dict:
    groups = _load_groups()
    for g in groups:
        if g["group_id"] == group_id:
            return g
    return {"error": "Group not found"}
