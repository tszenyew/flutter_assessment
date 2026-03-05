# Food Delivery Service Prompts

**AI Tool Used:** 
-Gemini — used to structure and refine the initial development prompt
-VS Code Copilot Agent (GPT-5.3-Codex) — used to generate the Flutter project using /plan mode

# Initial Prompt

Generate a complete Flutter application for a Food Delivery App using mock data only (no backend) in this folder.

Requirements:

Screens:
1. Restaurant List Screen
   - List of restaurants
   - Show image, restaurant name, rating, and cuisine type
   - Tapping a restaurant navigates to its menu

2. Food Menu Screen
   - Displays menu items for the selected restaurant
   - Each item shows image, name, price
   - Include an “Add to Cart” button

3. Checkout Screen
   - Display selected items in cart
   - Show item quantity
   - Show subtotal
   - Show delivery fee
   - Show total
   - Include “Place Order” button

4. Order Tracking Screen
   - After placing order navigate to tracking screen
   - Show order status (Preparing → On the way → Delivered)
   - also show a mock map UI

Technical Requirements:
- Flutter 3+
- Use standard Material Design 3
- Use Getx for state management
- Clean folder structure
- Separate widgets/screens
- Mock data stored locally
- Use placeholder images
- Code must compile and run

Project Structure Example:

lib/
    main.dart
    screens/
        feat_name/
            widgets/ (if needed)
            models/ (if needed)
            feat_screen
            feat_vm
    common/
        widgets
    api/
        repository/
            mockRepo 
        data/
            mockData
    routes/
        screen_route


---
# Second Iteration Prompt

Update the generated Flutter project with the following improvements:

1. Theme
   - Update the application theme to a **red food-style theme**
   - Primary color should be red
   - Apply consistent color styling across AppBar, buttons, and important UI elements

2. Images
   - Replace placeholder/mock images with **food and restaurant images from free image sources**
   - Example sources: Unsplash, Pexels, or other royalty-free image providers
   - Ensure the images are appropriate for restaurants and food menu items

3. Image Loading Optimization
   - Use the `cached_network_image_ce` Flutter package for loading network images
   - Replace all `Image.network` usages with `CachedNetworkImage`
   - Include:
     - loading placeholder
     - error widget fallback
     - proper caching support

4. Code Update Requirements
   - Add the required dependency in `pubspec.yaml`
   - Update all relevant widgets displaying network images
   - Ensure the project still compiles and runs successfully

Do not change the existing app structure or navigation logic.
Focus only on theme, image sources, and network image optimization.

---
# Third Iteration Prompt

Enhance the Flutter project by adding proper application branding including an App Name, App Icon, and Splash Screen.

1. App Name
   - Set the application name to **"QuickBite"**
   - Update the app name in:
     - Android configuration
     - iOS configuration
     - Web title
   - The name should appear correctly when the app is installed or launched.

2. App Icon
   - Generate a modern **food delivery themed app icon**
   - Style: minimal, flat design
   - Colors: red theme to match the app UI
   - Icon concept ideas: food box, burger, delivery bag, or fork & spoon

   Implementation:
   - Use the `flutter_launcher_icons` package
   - Generate icons for Android, iOS, and Web
   - Update `pubspec.yaml` configuration

3. Splash Screen
   - Create a branded splash screen using:
     `flutter_native_splash`

   Requirements:
   - Background color: red (matching app theme)
   - Center logo: the generated app icon
   - Display app name "QuickBite"
   - Ensure compatibility with Android, iOS, and Web

4. Dependency Updates
   Add the following packages:

   - flutter_launcher_icons
   - flutter_native_splash

5. Configuration
   - Update `pubspec.yaml` with the required configuration
   - Generate the assets automatically using the package commands
   - Ensure the project builds and runs successfully after the changes.

Do not modify the existing application logic or screen implementation.
Focus only on branding assets and startup configuration.

# Fourth Iteration Prompt

Refactor the cart button implementation to improve reusability and visual clarity.

1. Create a Reusable Cart Button Widget
   - Extract the existing cart button from the AppBar into a reusable widget
   - Create a new widget: `CartButton`
   - Place it inside the `/widgets` directory
   - The widget should:
     - Display a cart icon
     - Show a badge with the number of items in the cart
     - Navigate to the Checkout screen when tapped
     - Accept the cart count via state management (Provider or similar)

2. Replace Existing Cart Buttons
   - Update all screens that currently use the cart icon in the AppBar
   - Replace them with the new `CartButton` widget

3. Badge Color Improvement
   - Update the badge color so it is **visually distinct from the AppBar color**
   - The badge must remain highly visible when the AppBar uses the red theme
   - Example approaches:
     - Use a contrasting color (e.g., white, amber, or dark red)
     - Ensure the text inside the badge remains readable

4. Code Quality
   - Keep the widget modular and reusable
   - Ensure the cart count updates reactively when items are added
   - Maintain compatibility with the existing app navigation and cart state logic

Do not change the business logic of the cart system. Focus only on UI refactoring and visual improvements.

# Fifth Iteration Prompt (attached cart_button.dart as context)

Fix the cart badge so it does not block user tap gestures on the cart button.