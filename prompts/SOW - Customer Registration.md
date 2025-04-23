# Meta Header
**Version**: 2.0  
**Template Type**: Prompt Engineering Scaffold  
**Purpose**: Structured prompt for generating a detailed Statement of Work (SOW) for a software project  
**Author**: bobwares
**Notes**: This prompt is designed to help generate a professional-grade SOW for software development projects, ensuring clarity, consistency, and completeness across all major sections.

---

## ChatGPT Instructions
You are an advanced AI language assistant.  
Read all sections below but only act on the **## Tasks** section. Use the other sections as contextual input to guide your tone, format, and content.

- Text in brackets [ ] is for the documentation and not part of the prompt instructions to the assistant.

---

## CLI Instructions (for User)
- Keep all section headers (`##`) intact.
- Add details to improve quality (e.g., examples, constraints).
- ChatGPT will only process the final `## Tasks` section.

---

## Context
This prompt will be used to generate a professional Statement of Work (SOW) for a software development project focused on building a **Customer Registration System**. The target audience includes both technical stakeholders (e.g., engineering managers, architects) and non-technical stakeholders (e.g., product owners, business sponsors).

The SOW will define project goals, scope, timeline, deliverables, responsibilities, assumptions, and risks. It must be written clearly and professionally to support planning, contracting, and execution.

---

## Role
You are acting as a **senior software consultant and technical project manager** with experience in requirements gathering, enterprise system design, and agile delivery practices. You are responsible for writing a complete and clear Statement of Work that aligns both business needs and technical feasibility.

---

## Format
The output should follow the standard SOW structure:

1. **Executive Summary**
2. **Project Objectives**
3. **Scope of Work**
4. **Deliverables**
5. **Project Timeline**
6. **Roles and Responsibilities**
7. **Assumptions**
8. **Constraints**
9. **Out of Scope**
10. **Risks and Mitigation**
11. **Acceptance Criteria**
12. **Appendices or References (if applicable)**

---

## Tone
- Professional and formal
- Clear and direct language
- Avoid jargon unless explicitly defined

---

## Examples
Here is an example phrase for the Executive Summary:
> “The purpose of this Statement of Work (SOW) is to outline the technical and business approach for delivering a customer registration system that captures, validates, and manages customer onboarding data.”

And for Project Objectives:
> “This project aims to streamline customer onboarding, ensure data accuracy, and integrate with backend services for identity verification and account provisioning.”

---

## Constraints
- Avoid the use of emojis or informal language
- Output must be in markdown for readability
- Do not include pricing or legal clauses
- Do not invent features beyond a realistic registration system unless specified

---

## Tasks
Generate a complete Statement of Work (SOW) for a software project to build a **Customer Registration System**.

The system should:
- Support user registration via a web interface
- Validate and persist customer data (name, contact info, address, optional photo ID)
- Allow admin users to view and approve/reject registrations
- Integrate with backend APIs for email confirmation and optional third-party identity verification
- Include basic audit logging for data changes
- Be deployed to a cloud environment

Use the format, tone, and context above. The SOW should be suitable for review by both technical leads and business stakeholders.