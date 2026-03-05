# Voucher App Prompts

**AI Tool Used:** 
-Gemini --- used to structure and refine the initial development prompt
-VS Code Copilot Agent (GPT-5.3-Codex) --- used to generate the Flutter project using /plan mode

# Initial Prompt

Generate a voucher selection and QR code payment app using mock data only (no backend) in this folder.


Screens:
1. Voucher List Screen

- Display the following vouchers:
    Voucher   Quantity
    --------- ----------
    \$2       2
    \$5       2
    \$10      2

    Each voucher instance must be individually selectable.

    Example interpretation: - Two selectable \$2 vouchers - Two selectable
    \$5 vouchers - Two selectable \$10 vouchers

    Users can select multiple vouchers across different types.

- Selection Behaviour
    Each voucher instance must behave like an independent selectable item.

    Examples of valid selections:

    -   \$2 + \$2
    -   \$2 + \$5 + \$10
    -   \$5 + \$5 + \$10

    Selections must be stored in application state.

- Pay Button
    A clearly visible "Pay" button must be displayed on the Voucher
    Selection Screen.

    Behaviour: - Disabled when no voucher is selected - Enabled when at
    least one voucher is selected - Tapping Pay navigates to the QR Code
    Payment Screen


2. QR Code Payment Screen

The screen must display:

- QR Code
    The QR code content must be a plain-text string containing the selected
    voucher values separated by commas.

    Example selection: - \$2 - \$2 - \$10

    QR content:

        2,2,10

- Total Amount
    Example:
        Total: $14

Data design:
- VoucherItem class with 
    int id, 
    amount double, 

Repo design:
- MockRepo
    return list of VoucherItem

UI & Theme Requirements:
- Use standard Material Design 3 with Modern design templates

Technical Requirements:
- Flutter 3+
- Use Getx for state management
- Use qr_flutter package for QR code
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

Screen Example:
    class FeatScreen extends StatelessWidget{
        final FeatVM vm = Get.put(FeatVM());

        -----
    }

Ask and double confirm if any ambigous exist about the requirement.

# Second Iteration prompt
Remove Available text from VoucherScreen
Remove qr_payload_text from PaymentScreen

# Third Iteration prompt
Act as an expert Flutter UI/UX Designer. I need to revamp the visual design of my Voucher Selection and QR Code Payment app to a "professional business level" standard. 

STRICT CONSTRAINTS:
- DO NOT change the existing app folder structure or file locations.
- DO NOT change the GetX state management logic, ViewModels, or Data models.
- DO NOT alter any routing or navigation logic.
- Focus strictly on modifying the `build` methods, Theme data, and UI widgets.

UI/THEME REQUIREMENTS (Material Design 3):
1. Global Theme (`main.dart`):
   - Implement a clean, modern corporate color palette (e.g., deep slate blue primary, crisp white background, subtle cool-grey surfaces).

2. Voucher Selection Screen (`voucher_screen.dart` & `widgets`):
   - Redesign the voucher items into elegant, modern Cards. 
   - Keep the card content compact, showing the Voucher Amount and checkbox only.

3. Pay Button (Bottom Fixed Area):
   - Wrap the Pay button in a bottom surface area (like a bottom app bar or a styled container with top elevation) that anchors cleanly to the bottom safe area.
   - The button should be a full-width `FilledButton`.
   - Use clear visual states for enabled (vibrant primary color) vs. disabled (muted grey, flat).

4. QR Code Payment Screen (`payment_screen.dart`):
   - Wrap the QR code in a clean, white, elevated Card container with generous padding to ensure scanning reliability and a polished look.
   - Display the total amount prominently at the bottom right of the QR with a large, bold typography style.


Please provide the updated `ThemeData` first, followed by the updated widget code for the Voucher and Payment screens.

# Fourth Iteration prompt
Enhance the Flutter project by adding proper application branding including an App Name, App Icon, and Splash Screen.

1. App Name
   - Set the application name to **"VoucherQRPay"**
   - Update the app name in:
     - Android configuration
     - iOS configuration
     - Web title
   - The name should appear correctly when the app is installed or launched.

2. App Icon
   - Lookup for a modern **QR Pay app icon**

   Implementation:
   - Use the `flutter_launcher_icons` package
   - Generate icons for Android, iOS, and Web
   - Update `pubspec.yaml` configuration

3. Splash Screen
   - Create a branded splash screen using:
     `flutter_native_splash`

   Requirements:
   - Background color: blue slate #1F3A5F (matching app theme)
   - Center logo: the generated app icon
   - Display app name "VoucherQRPay"
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