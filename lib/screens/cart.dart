
import 'package:coffee/helpers/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:coffee/theme/app_theme.dart';
import 'package:coffee/state/app_state.dart';

class Cart extends StatefulWidget {
  static String routeName = '/cart';
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isDelivery = true;
  late final AppState appState;
  bool _hasLoadedCart = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasLoadedCart) {
      appState = AppState.of(context);
      appState.cart.loadCart();
      _hasLoadedCart = true;
    }
  }

  void clear(BuildContext context) {
    AppState.of(context).cart.clear();
  }

  @override
  Widget build(BuildContext context) {
    final cartState = AppState.of(context).cart;
    final items = cartState.items;

    return Scaffold(
      backgroundColor: AppTheme.scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  color: AppTheme.textColorPrimary,
                  iconSize: 28,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Center(
                    child: Text("Order", style: AppTheme.appBarTitle),
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              height: 43,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppTheme.lightGrayBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isDelivery = true),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDelivery
                              ? AppTheme.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Deliver",
                            style: AppTheme.buttonText.copyWith(
                              fontWeight: isDelivery
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: isDelivery
                                  ? Colors.white
                                  : AppTheme.textColorPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isDelivery = false),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isDelivery
                              ? AppTheme.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Pick Up",
                            style: AppTheme.buttonText.copyWith(
                              fontWeight: !isDelivery
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: !isDelivery
                                  ? Colors.white
                                  : AppTheme.textColorPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 140,
              height: 24,
              child: Text('Delivery Address', style: AppTheme.cardTitle),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 21,
              child: Text('Jl. Kpg Sutoyo', style: AppTheme.bodyMedium),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 12,
              child: Text(
                'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
                style: AppTheme.addressText,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppTheme.textColorSecondary,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.edit_calendar_rounded,
                        size: 14,
                        color: AppTheme.textColorDark,
                      ),
                      const SizedBox(width: 4),
                      Text("Edit Address", style: AppTheme.smallText),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppTheme.textColorSecondary,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.note_add,
                        size: 14,
                        color: AppTheme.textColorDark,
                      ),
                      const SizedBox(width: 4),
                      Text("Add Note", style: AppTheme.smallText),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 295,
              child: Divider(
                color: AppTheme.borderColor,
                thickness: 1,
                height: 0,
              ),
            ),
            const SizedBox(height: 7),
            if (items.isNotEmpty) ...[
              const SizedBox(height: 16),
              ...items.map(
                    (item) => CartItemWidget(
                  item: item,
                  onUpdate: () => cartState.update(),
                ),
              ),
              Divider(thickness: 4, color: AppTheme.cardBorder),
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppTheme.lightGrayBackground,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: const Icon(
                            Icons.local_offer,
                            size: 16,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Text
                        Text(
                          "1 Discount is Applied",
                          style: AppTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                height: 24,
                child: Text('Payment Summary', style: AppTheme.cardTitle),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price", style: AppTheme.bodyPrimary),
                  Text(
                    "\$${cartState.totalPrice.toStringAsFixed(2)}",
                    style: AppTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Fee", style: AppTheme.bodyPrimary),
                  Row(
                    children: [
                      Text(
                        "\$2.0",
                        style: AppTheme.bodyPrimary.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text("\$1.0", style: AppTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: items.isNotEmpty
          ? Container(
        width: double.infinity,
        height: 180,
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: AppTheme.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cash/Wallet",
                          style: AppTheme.bodyMedium.copyWith(
                            fontSize: 14,
                            height: 1.2,
                          ),
                        ),
                        Text(
                          "\$${(cartState.totalPrice + 1).toStringAsFixed(2)}",
                          style: AppTheme.smallText.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryColor,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 24,
                  color: AppTheme.textColorPrimary,
                ),
              ],
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/order');
                  clear(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: Text("Order", style: AppTheme.buttonText),
              ),
            ),
          ],
        ),
      )
          : null,
    );
  }
}
