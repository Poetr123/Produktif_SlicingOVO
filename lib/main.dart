import 'package:flutter/material.dart';

void main() {
  runApp(const OvoApp());
}

class OvoApp extends StatelessWidget {
  const OvoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OVO',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5B2DD8)),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    FinancePage(),
    PayPage(),
    InboxPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: OvoBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: 74,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFD6CCFF), Color(0xFFB8A9F4)],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                        child: Row(
                          children: [
                            const Text(
                              'OVO',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                color: Color(0xFF4D22C7),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.28),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.local_offer_rounded,
                                    size: 18,
                                    color: Color(0xFF4D22C7),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    'Promo',
                                    style: TextStyle(
                                      color: Color(0xFF4D22C7),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -1),
                      child: const _BalanceCard(),
                    ),
                    const SizedBox(height: 12),
                    const _StampBanner(),
                    const SizedBox(height: 14),
                    const _ServiceTabs(),
                    const SizedBox(height: 20),
                    const _PromoBanner(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9),
      height: 147,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF4E64D7), Color(0xFF4353CF), Color(0xFF5B22C8)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.12),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            left: 105,
            child: Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF397BE3).withOpacity(.45),
                borderRadius: BorderRadius.circular(80),
              ),
            ),
          ),
          Positioned(
            bottom: -55,
            right: -25,
            child: Container(
              width: 170,
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xFF5B23C8).withOpacity(.55),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 10, 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'OVO Cash',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Total Saldo ⓘ',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Tap untuk lihat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _BalanceAction(icon: Icons.add_circle, label: 'Top Up'),
                    _BalanceAction(
                      icon: Icons.arrow_upward_rounded,
                      label: 'Transfer',
                    ),
                    _BalanceAction(
                      icon: Icons.account_balance_wallet_rounded,
                      label: 'Tarik Tunai',
                    ),
                    _BalanceAction(
                      icon: Icons.receipt_long_rounded,
                      label: 'History',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 56,
            right: 13,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.monetization_on,
                    size: 15,
                    color: Color(0xFF454545),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'OVO Points',
                    style: TextStyle(
                      color: Color(0xFF353535),
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.chevron_right, size: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BalanceAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BalanceAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 23, color: Colors.white),
        const SizedBox(height: 3),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
      ],
    );
  }
}

class _StampBanner extends StatelessWidget {
  const _StampBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9),
      height: 94,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 77,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.track_changes_rounded,
                  size: 42,
                  color: Color(0xFF4B25CB),
                ),
                Positioned(
                  right: 12,
                  bottom: 17,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFC62B),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.star,
                      size: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cek data kamu demi kelancaran',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'pemakaian akun OVO Premier kamu.',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 13, top: 39),
            child: SizedBox(
              width: 88,
              height: 31,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5524D4),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Cek',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceTabs extends StatelessWidget {
  const _ServiceTabs();

  @override
  Widget build(BuildContext context) {
    final items = [
      const _ServiceItem(
        icon: Icons.account_balance_wallet_rounded,
        title: 'Nabung by\nSuperbank',
        badge: 'BARU',
      ),
      const _ServiceItem(
        icon: Icons.currency_exchange_rounded,
        title: 'Pinjaman',
        badge: '100JT',
      ),
      const _ServiceItem(
        icon: Icons.receipt_long_rounded,
        title: 'Uang\nElektronik',
        badge: 'Rp 1',
      ),
      const _ServiceItem(
        icon: Icons.receipt_rounded,
        title: 'Angsuran\nKredit',
      ),
      const _ServiceItem(
        icon: Icons.phone_android_rounded,
        title: 'Pulsa/Paket\nData',
        badge: 'PROMO',
      ),
      const _ServiceItem(
        icon: Icons.bolt_rounded,
        title: 'PLN',
        badge: 'PROMO',
      ),
      const _ServiceItem(icon: Icons.water_drop_rounded, title: 'Air PDAM'),
      const _ServiceItem(icon: Icons.tv_rounded, title: 'Internet &\nTV Kabel'),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F1F8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Favorit',
                  style: TextStyle(
                    color: Color(0xFF5D2AD3),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 18),
              const Text(
                'Finansial',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 23),
              const Text(
                'Hiburan',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 21),
              const Text(
                'Pilihan Lain',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 13),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 89,
            crossAxisSpacing: 8,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ],
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? badge;

  const _ServiceItem({required this.icon, required this.title, this.badge});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 43,
              height: 43,
              decoration: const BoxDecoration(
                color: Color(0xFFF1E8FF),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFF5D2AD4), size: 23),
            ),
            if (badge != null)
              Positioned(
                top: -7,
                left: -4,
                right: -4,
                child: Container(
                  height: 13,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF183D),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    badge!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 6,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 7),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 10,
            height: 1.15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 0),
        children: const [
          _PromoCard(title: 'Dana', subtitle: 'Promo spesial untukmu'),
          _PromoCard(title: 'KrediOne', subtitle: 'Limit Pinjaman Hingga'),
        ],
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _PromoCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 202,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF27155F), Color(0xFF613BC5)],
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(9, 20, 9, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 1, bottom: 15),
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF202020),
                          ),
                        ),
                      ),
                      const _ProfileCard(),
                      const SizedBox(height: 15),
                      const _LoyaltyCode(),
                      const SizedBox(height: 30),
                      const _ProfileSectionTitle(title: 'Akun'),
                      const SizedBox(height: 8),
                      const _ProfileMenu(
                        icon: Icons.account_balance_wallet_outlined,
                        title: 'OVO Premier',
                        action: 'Upgrade',
                        showArrow: false,
                      ),
                      const _ProfileMenu(
                        icon: Icons.monetization_on_outlined,
                        title: 'OVO Points',
                      ),
                      const _ProfileMenu(
                        icon: Icons.star_rounded,
                        title: 'OVO Stamp',
                      ),
                      const _ProfileMenu(
                        icon: Icons.link_rounded,
                        title: 'Aplikasi Terhubung',
                        badge: 'NEW',
                      ),
                      const SizedBox(height: 27),
                      const _ProfileSectionTitle(title: 'Bantuan'),
                      const SizedBox(height: 8),
                      const _ProfileMenu(
                        icon: Icons.help_rounded,
                        title: 'Pusat Bantuan',
                      ),
                      const SizedBox(height: 27),
                      const _ProfileSectionTitle(title: 'Keamanan'),
                      const SizedBox(height: 8),
                      const _ProfileMenu(
                        icon: Icons.lock_outline_rounded,
                        title: 'Keamanan Akun',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E2E2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 31,
            height: 31,
            decoration: const BoxDecoration(
              color: Color(0xFFE7D8FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: Color(0xFF6434CE), size: 20),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ananda Putra Prawira',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 4),
                Text(
                  '0812-3456-7890',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Text(
            'Ubah',
            style: TextStyle(
              color: Color(0xFF3D68C9),
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoyaltyCode extends StatelessWidget {
  const _LoyaltyCode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.view_week_rounded, size: 27, color: Color(0xFF252525)),
          SizedBox(width: 10),
          Text(
            'Loyalty Code',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _ProfileSectionTitle extends StatelessWidget {
  final String title;

  const _ProfileSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: Color(0xFF383142),
      ),
    );
  }
}

class _ProfileMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? action;
  final String? badge;
  final bool showArrow;

  const _ProfileMenu({
    required this.icon,
    required this.title,
    this.action,
    this.badge,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE9E9E9), width: .8)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Icon(icon, size: 20, color: const Color(0xFF222222)),
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          if (badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFFF3153),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Text(
                badge!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 7,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          if (action != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF5728D5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                action!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          if (showArrow)
            const Icon(
              Icons.chevron_right_rounded,
              size: 23,
              color: Color(0xFF222222),
            ),
        ],
      ),
    );
  }
}

class OvoBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const OvoBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE8E8E8), width: .8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomItem(
            icon: Icons.home_rounded,
            label: 'Home',
            selected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _BottomItem(
            icon: Icons.account_balance_wallet_rounded,
            label: 'Finance',
            selected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          _PayButton(selected: currentIndex == 2, onTap: () => onTap(2)),
          _BottomItem(
            icon: Icons.notifications_rounded,
            label: 'Inbox',
            selected: currentIndex == 3,
            badge: '36',
            onTap: () => onTap(3),
          ),
          _BottomItem(
            icon: Icons.person_rounded,
            label: 'Profile',
            selected: currentIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final String? badge;
  final VoidCallback onTap;

  const _BottomItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFF5425D2) : const Color(0xFF777777);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 58,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(icon, size: 22, color: color),
                if (badge != null)
                  Positioned(
                    right: -9,
                    top: -7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF334F),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        badge!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 6,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 9,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PayButton extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;

  const _PayButton({required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform.translate(
        offset: const Offset(0, -11),
        child: Container(
          width: 49,
          height: 49,
          decoration: BoxDecoration(
            color: const Color(0xFF6936DE),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'PAY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Finance',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Pay',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Inbox',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
