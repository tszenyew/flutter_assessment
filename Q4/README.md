## Approach

The task was approached using an iterative AI-assisted development workflow.

First, the requirements were broken down into screens, UI elements, technical constraints, and a preferred Flutter project structure (`data`, `models`, `screens`, `widgets`). These details were provided to **Gemini Agent** to help generate a clear and organized initial prompt.

The prompt was then executed using **VS Code Copilot Agent (GPT-5.3-Codex)** in `/plan` mode. The generated implementation plan was reviewed before allowing the agent to proceed with building the Flutter project.

After the initial implementation, the app was tested in an emulator. The UI appeared functional but visually plain, so a second prompt was created to introduce a red food-themed design, replace placeholder images with real food images, and integrate `cached_network_image_ce` for network image loading.

Subsequent prompts were used to add proper app branding (app name, icon, splash screen), refactor the AppBar cart button into a reusable widget, and fix a badge interaction issue that blocked tap gestures.

This iterative prompt-refine-test workflow allowed the application to be progressively improved while maintaining a clean project structure.