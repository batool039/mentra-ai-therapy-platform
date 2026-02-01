# Mentra AI Therapy Focus Group Platform

This repository contains a prototype mental health support platform built for the Mentra Challenge.

The system allows users to chat with an AI assistant, receive category insights, get matched into a focus group, schedule a session, complete a mock payment flow, and generate a therapist handoff summary.

---

Project Structure

mentra-ai-therapy-platform/
  mentra_app/          Flutter frontend
  backend_fastapi/     FastAPI backend
  LICENSE
  README.md

---

Backend Setup (FastAPI)

1. Open a terminal and go to the backend folder:

cd backend_fastapi

2. Install dependencies:

pip install -r requirements.txt

3. Run the backend server:

uvicorn main:app --reload

4. Backend will be available at:

http://127.0.0.1:8000

Swagger documentation:

http://127.0.0.1:8000/docs

---

Frontend Setup (Flutter)

1. Open a new terminal and go to the Flutter app folder:

cd mentra_app

2. Install dependencies:

flutter pub get

3. Run the app in the browser:

flutter run -d chrome

---

API Endpoints Used

GET  /health
POST /analyze-user
GET  /group/{group_id}/brief
POST /schedule
POST /pay

---

Demo Flow

1. Welcome and consent screen
2. Chat with the AI assistant
3. Group match result screen
4. Scheduling screen
5. Payment confirmation screen (mock)
6. Final session booked screen
7. Therapist handoff dashboard

---

License

This project is released under the MIT License.
