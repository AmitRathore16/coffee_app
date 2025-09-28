A Flutter app for exploring coffee products, managing your cart, favorites, and placing orders — built with a clean modular architecture and lightweight custom state management.

Setup:
The source code is divided into various folders:
1) api - this folder contains all the api files. example- login api, cart api
2) screens - this folder contains all the files for creating screens i.e: login screen, home screen, favourites screen, cart screen, delivery screen, product details screen
3) helpers - This folder contains widgets that were required to create screens. So, in simpler words, each screen is broken into various components(widgets) and then the screens use these widgets.
4) models - this folder contains the user model, product model and cart model.
5) theme - this folder contains app_theme which is used throughout the project.
6) widgets - these are the reusable widgets that are used multiple times in the project.
7) state - this folder is used for custom state management.
  
Architecture:
The entry point of the code is main.dart file. here we check if the user is already loggedIn or not.
if the user is already logged in, he gets navigated to bottom bar.
if the user has opened the app for the first time, he gets directed to the login screen where user will login into the app. currently I have used mock API for login but we can integrate actual signin and signup api in the final version.
when the user logs in, he gets navigated to the bottom bar.
Bottom bar, is a bottom navigation bar which has 4 tabs - home, favourites, notifications and cart.
for the home tab, we call home screen, favourites screen for favourites tab and cart screen for cart tab.
Home screen:
this screen is divided into 3 major widgets: top bar, category box and category chips. 
top bar has the upper part of screen(black gradient box which has search bar, location, filter button, dark mode toggle button)
category chips is the horizontal scrollable widget which has various categories for filtering out the products based on categories.
category box shows all the products using the coffee card widget.
the coffee card widget has a add button which when pressed, adds that product to card. 
when the coffes card is tapped, user gets navigated to product details screen.
this screen also uses a banner card widget to show the promo banner on home screen.
product details screen shows the complete details of the product, where user can add the product to favuorites, and add the product to cart with selected quantity and size.
This screen also uses a ReadMore widget to show the product description. This ReadMore widget uses LayoutBuilder to get the available width of the text container and TextPainter to check whether the text overflows the given line limit.
Favourites screen-> this screen all the products added to favourite list using the coffee card widget. 
Cart screen-> this screen shows all the products that are added to cart using a cart item widget.Here, user can increase or decrease the quantity and when the quantity reduces to 0, product automatically gets removed from the cart. 
This screen also shows the address details of user.
this screen also has an order button and when the order button is pressed, user gets navigated to order screen.
order screen has a bottom nav bar which shows the timing and delivery partner details. the main part of this screen has a map which is made using flutter_map package. this map shows the delivery location, delivery partner location and a route. 
currently, the route, delivery location and delivery partner locations have fixed coordinates but they can be made functional using actual google map APIs. To paint the route in map, we have used polyline that connects the list of coordinates. 
it also has a gps button which when pressed, auto focuses the map to delivery location using fitcamera property.

State Management:
The app uses a simple custom state management. Each important part of the app has its own state — like AuthState for login/logout, CartState for managing cart items, and ThemeState for dark mode.
All these are combined together in a single AppState, so the whole app can easily access and react to changes.
all these states extend a small Notifier class that helps the UI rebuild whenever something changes.
We then use a CombinedNotifier to listen to multiple states together, so if any of them changes, the app gets updated. Finally, everything is wrapped in a single AppState, which makes it easy for any widget in the app to access and respond to these updates.
