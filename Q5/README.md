## Approach

I followed an **Iterative Prompt Engineering** workflow, treating the AI as a pair-programmer to evolve the app from a functional skeleton to a high-fidelity, production-ready Flutter application.


First, I write down screens, requirements, UI design, technical constraints, data models, folder structure, and some practice that i wish the agent to implements, then used gemini to help generate the initial prompt. Ensuring the generated code was clean, modular, and aligned with Flutter best practices (Separation of Concerns, Repository pattern).

The prompt was then executed using **VS Code Copilot Agent (GPT-5.3-Codex)** in `/plan` mode. The generated implementation plan was reviewed before allowing the agent to proceed with building the Flutter project.


After the initial implementation, the app was tested in an emulator. There are some unnessary view appear in the UI generated, second prompt is used to removed unnecessary UI elements and raw payload strings to keep the interface focused on primary user tasks.

Subsequent prompts were used to update UI theme and layout with a Material Design 3 aesthetic, and add proper app branding (app name, icon, splash screen), 
