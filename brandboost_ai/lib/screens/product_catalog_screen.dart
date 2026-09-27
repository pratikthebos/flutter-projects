
import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/app_background.dart';

class ProductCatalogScreen extends StatefulWidget {
  const ProductCatalogScreen({super.key});

  @override
  State<ProductCatalogScreen> createState() =>
      _ProductCatalogScreenState();
}

class _ProductCatalogScreenState extends State<ProductCatalogScreen> {
  final TextEditingController _search = TextEditingController();

  String _category = 'All';
  String _sortBy = 'Featured';
  String _selectedTab = 'All products';

  bool _gridView = true;
  bool _favoritesOnly = false;

  final Set<String> _favorites = {};
  final Map<String, int> _bag = {};

  final List<_Product> _products = [
    _Product(
      id: 'P001',
      name: 'Glow Serum',
      category: 'Skincare',
      price: 799,
      oldPrice: 999,
      rating: 4.9,
      reviews: 284,
      badge: 'BESTSELLER',
      description:
      'A lightweight skincare serum designed for a fresh, '
          'hydrated-looking glow. Perfect for your daily skincare routine.',
      icon: Icons.spa_outlined,
      color: AppColors.pink,
      tags: ['serum', 'beauty', 'glow', 'skincare'],
    ),
    _Product(
      id: 'P002',
      name: 'Everyday Tote',
      category: 'Fashion',
      price: 1299,
      oldPrice: 1599,
      rating: 4.7,
      reviews: 156,
      badge: 'POPULAR',
      description:
      'A versatile everyday tote for work, shopping, and travel. '
          'A practical accessory for your daily essentials.',
      icon: Icons.shopping_bag_outlined,
      color: AppColors.cyan,
      tags: ['bag', 'tote', 'fashion', 'accessory'],
    ),
    _Product(
      id: 'P003',
      name: 'Ceramic Mug',
      category: 'Lifestyle',
      price: 499,
      oldPrice: 649,
      rating: 4.8,
      reviews: 98,
      badge: 'TRENDING',
      description:
      'A minimal ceramic mug for coffee, tea, and your favorite '
          'morning rituals. A thoughtful gift for any occasion.',
      icon: Icons.coffee_outlined,
      color: AppColors.orange,
      tags: ['coffee', 'tea', 'ceramic', 'gift'],
    ),
    _Product(
      id: 'P004',
      name: 'Hydration Bottle',
      category: 'Lifestyle',
      price: 699,
      oldPrice: 899,
      rating: 4.6,
      reviews: 212,
      badge: 'POPULAR',
      description:
      'A reusable hydration bottle for your work desk, gym bag, '
          'and everyday adventures.',
      icon: Icons.water_drop_outlined,
      color: AppColors.purple,
      tags: ['bottle', 'water', 'gym', 'fitness'],
    ),
    _Product(
      id: 'P005',
      name: 'Cloud Sneakers',
      category: 'Fashion',
      price: 2499,
      oldPrice: 2999,
      rating: 4.9,
      reviews: 342,
      badge: 'BESTSELLER',
      description:
      'Modern everyday sneakers designed for a casual, versatile '
          'look. Style them with your favorite outfits.',
      icon: Icons.directions_run_outlined,
      color: AppColors.green,
      tags: ['shoes', 'sneakers', 'running', 'fashion'],
    ),
    _Product(
      id: 'P006',
      name: 'Vitamin C Cream',
      category: 'Skincare',
      price: 649,
      oldPrice: 799,
      rating: 4.5,
      reviews: 117,
      badge: 'NEW',
      description:
      'A daily face cream concept for a simple skincare routine. '
          'A great product to feature in a beauty campaign.',
      icon: Icons.face_retouching_natural,
      color: AppColors.orange,
      tags: ['cream', 'face', 'beauty', 'skincare'],
    ),
    _Product(
      id: 'P007',
      name: 'Minimal Watch',
      category: 'Fashion',
      price: 1899,
      oldPrice: 2299,
      rating: 4.7,
      reviews: 185,
      badge: 'PREMIUM',
      description:
      'A clean, minimal watch concept for everyday styling. '
          'Pair it with casual and formal looks.',
      icon: Icons.watch_outlined,
      color: AppColors.purple,
      tags: ['watch', 'accessory', 'style', 'premium'],
    ),
    _Product(
      id: 'P008',
      name: 'Scented Candle',
      category: 'Lifestyle',
      price: 399,
      oldPrice: 499,
      rating: 4.8,
      reviews: 143,
      badge: 'TRENDING',
      description:
      'A decorative scented candle for cozy evenings, relaxing '
          'spaces, and thoughtful gifting.',
      icon: Icons.local_fire_department_outlined,
      color: AppColors.pink,
      tags: ['candle', 'home', 'decor', 'gift'],
    ),
    _Product(
      id: 'P009',
      name: 'Wireless Earbuds',
      category: 'Electronics',
      price: 1999,
      oldPrice: 2499,
      rating: 4.6,
      reviews: 412,
      badge: 'POPULAR',
      description:
      'A wireless audio accessory concept for music, calls, '
          'commuting, and everyday entertainment.',
      icon: Icons.headphones_outlined,
      color: AppColors.cyan,
      tags: ['earbuds', 'audio', 'music', 'tech'],
    ),
    _Product(
      id: 'P010',
      name: 'Smart Desk Lamp',
      category: 'Electronics',
      price: 1499,
      oldPrice: 1799,
      rating: 4.5,
      reviews: 87,
      badge: 'NEW',
      description:
      'A contemporary desk lamp concept for study corners, '
          'home offices, and creative workspaces.',
      icon: Icons.lightbulb_outline_rounded,
      color: AppColors.orange,
      tags: ['lamp', 'desk', 'office', 'home'],
    ),
    _Product(
      id: 'P011',
      name: 'Travel Backpack',
      category: 'Fashion',
      price: 1799,
      oldPrice: 2199,
      rating: 4.8,
      reviews: 267,
      badge: 'BESTSELLER',
      description:
      'A versatile backpack concept for daily commutes, college, '
          'weekend outings, and short trips.',
      icon: Icons.backpack_outlined,
      color: AppColors.green,
      tags: ['backpack', 'travel', 'college', 'bag'],
    ),
    _Product(
      id: 'P012',
      name: 'Face Cleanser',
      category: 'Skincare',
      price: 349,
      oldPrice: 449,
      rating: 4.4,
      reviews: 93,
      badge: 'VALUE PICK',
      description:
      'A skincare cleanser concept for a simple morning and '
          'evening personal-care routine.',
      icon: Icons.water_drop_rounded,
      color: AppColors.cyan,
      tags: ['cleanser', 'face wash', 'beauty', 'skincare'],
    ),
    _Product(
      id: 'P013',
      name: 'Classic Sunglasses',
      category: 'Fashion',
      price: 999,
      oldPrice: 1299,
      rating: 4.6,
      reviews: 176,
      badge: 'TRENDING',
      description:
      'A classic sunglasses concept that adds a stylish finishing '
          'touch to casual and travel outfits.',
      icon: Icons.remove_red_eye_outlined,
      color: AppColors.pink,
      tags: ['sunglasses', 'eyewear', 'summer', 'fashion'],
    ),
    _Product(
      id: 'P014',
      name: 'Yoga Mat',
      category: 'Lifestyle',
      price: 899,
      oldPrice: 1099,
      rating: 4.7,
      reviews: 201,
      badge: 'POPULAR',
      description:
      'A fitness accessory concept for yoga, stretching, and '
          'home workout sessions.',
      icon: Icons.self_improvement_rounded,
      color: AppColors.green,
      tags: ['yoga', 'fitness', 'workout', 'wellness'],
    ),
    _Product(
      id: 'P015',
      name: 'Bluetooth Speaker',
      category: 'Electronics',
      price: 1299,
      oldPrice: 1599,
      rating: 4.5,
      reviews: 164,
      badge: 'HOT',
      description:
      'A portable audio product concept for listening to music '
          'at home, while travelling, or outdoors.',
      icon: Icons.speaker_rounded,
      color: AppColors.purple,
      tags: ['speaker', 'bluetooth', 'music', 'tech'],
    ),
    _Product(
      id: 'P016',
      name: 'Premium Notebook',
      category: 'Lifestyle',
      price: 299,
      oldPrice: 399,
      rating: 4.8,
      reviews: 76,
      badge: 'NEW',
      description:
      'A minimal notebook concept for journaling, planning, '
          'study notes, and daily productivity.',
      icon: Icons.menu_book_outlined,
      color: AppColors.orange,
      tags: ['notebook', 'stationery', 'study', 'office'],
    ),
    _Product(
      id: 'P017',
      name: 'Lip Care Balm',
      category: 'Skincare',
      price: 199,
      oldPrice: 249,
      rating: 4.3,
      reviews: 69,
      badge: 'VALUE PICK',
      description:
      'A compact personal-care product concept that fits easily '
          'into a daily beauty essentials collection.',
      icon: Icons.favorite_border_rounded,
      color: AppColors.pink,
      tags: ['lip balm', 'beauty', 'personal care'],
    ),
    _Product(
      id: 'P018',
      name: 'Power Bank',
      category: 'Electronics',
      price: 1099,
      oldPrice: 1399,
      rating: 4.6,
      reviews: 238,
      badge: 'POPULAR',
      description:
      'A portable charging accessory concept for people who '
          'need to keep their devices powered on the go.',
      icon: Icons.battery_charging_full_rounded,
      color: AppColors.green,
      tags: ['power bank', 'charger', 'mobile', 'tech'],
    ),
  ];

  final List<String> _categories = [
    'All',
    'Skincare',
    'Fashion',
    'Lifestyle',
    'Electronics',
  ];

  List<_Product> get _filteredProducts {
    final query = _search.text.trim().toLowerCase();

    final results = _products.where((product) {
      final matchesCategory =
          _category == 'All' || product.category == _category;

      final matchesTab = switch (_selectedTab) {
        'Favorites' => _favorites.contains(product.id),
        'On sale' => product.oldPrice > product.price,
        _ => true,
      };

      final searchableText = [
        product.name,
        product.category,
        product.id,
        product.badge,
        ...product.tags,
      ].join(' ').toLowerCase();

      final matchesSearch = query.isEmpty ||
          searchableText.contains(query);

      return matchesCategory && matchesTab && matchesSearch;
    }).toList();

    switch (_sortBy) {
      case 'Price: Low to High':
        results.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Price: High to Low':
        results.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Top Rated':
        results.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Name: A to Z':
        results.sort((a, b) => a.name.compareTo(b.name));
        break;
      default:
        break;
    }

    return results;
  }

  int get _bagCount =>
      _bag.values.fold(0, (total, quantity) => total + quantity);

  int get _bagTotal {
    var total = 0;
    for (final product in _products) {
      total += product.price * (_bag[product.id] ?? 0);
    }
    return total;
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  String _currency(int price) => '₹${price.toString()}';

  int _discount(_Product product) {
    if (product.oldPrice <= product.price) return 0;

    return ((product.oldPrice - product.price) /
        product.oldPrice *
        100)
        .round();
  }

  void _toggleFavorite(_Product product) {
    setState(() {
      if (!_favorites.add(product.id)) {
        _favorites.remove(product.id);
      }
    });
  }

  void _addToBag(_Product product) {
    setState(() {
      _bag[product.id] = (_bag[product.id] ?? 0) + 1;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to your bag'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'VIEW BAG',
          onPressed: _showBag,
        ),
      ),
    );
  }

  void _changeQuantity(_Product product, int change) {
    setState(() {
      final next = (_bag[product.id] ?? 0) + change;

      if (next <= 0) {
        _bag.remove(product.id);
      } else {
        _bag[product.id] = next;
      }
    });
  }

  void _showBag() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final bagProducts = _products
                .where((product) => (_bag[product.id] ?? 0) > 0)
                .toList();

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 42,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Your bag',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Text(
                          '$_bagCount items',
                          style: const TextStyle(
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    if (bagProducts.isEmpty)
                      const Padding(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          'Your bag is empty.\nAdd products to see them here.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.muted,
                            height: 1.5,
                          ),
                        ),
                      )
                    else
                      Flexible(
                        child: ListView(
                          shrinkWrap: true,
                          children: bagProducts.map((product) {
                            final quantity = _bag[product.id] ?? 0;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 13),
                              child: Row(
                                children: [
                                  _productIcon(product, size: 48),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          _currency(product.price),
                                          style: const TextStyle(
                                            color: AppColors.cyan,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _changeQuantity(product, -1);
                                      setSheetState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                    ),
                                  ),
                                  Text(
                                    '$quantity',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _changeQuantity(product, 1);
                                      setSheetState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    if (bagProducts.isNotEmpty) ...[
                      const Divider(color: AppColors.border),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Estimated total',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Text(
                              _currency(_bagTotal),
                              style: const TextStyle(
                                color: AppColors.cyan,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Demo bag only. No payment or checkout is connected.',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 10,
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Continue browsing'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showProductDetails(_Product product) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final favorite = _favorites.contains(product.id);

            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 12, 22, 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 42,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.border,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 190,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            product.color.withValues(alpha: 0.22),
                            AppColors.background2,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(
                              product.icon,
                              color: product.color,
                              size: 95,
                            ),
                          ),
                          Positioned(
                            top: 13,
                            left: 13,
                            child: _badge(product.badge, product.color),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              onPressed: () {
                                _toggleFavorite(product);
                                setSheetState(() {});
                              },
                              icon: Icon(
                                favorite
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: favorite
                                    ? AppColors.pink
                                    : AppColors.text,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 19),
                    Text(
                      product.category.toUpperCase(),
                      style: TextStyle(
                        color: product.color,
                        letterSpacing: 1.4,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.orange,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${product.rating}  (${product.reviews} reviews)',
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    Row(
                      children: [
                        Text(
                          _currency(product.price),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: AppColors.cyan,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _currency(product.oldPrice),
                          style: const TextStyle(
                            color: AppColors.muted,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 9),
                        _badge('${_discount(product)}% OFF', AppColors.green),
                      ],
                    ),
                    const SizedBox(height: 17),
                    const Text(
                      'About this product',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 12,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 17),
                    const Text(
                      'Search tags',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Wrap(
                      spacing: 7,
                      runSpacing: 7,
                      children: product.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.background2,
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                              color: AppColors.border,
                            ),
                          ),
                          child: Text(
                            '#$tag',
                            style: const TextStyle(
                              color: AppColors.muted,
                              fontSize: 10,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _addToBag(product);
                          Navigator.pop(sheetContext);
                        },
                        icon: const Icon(Icons.add_shopping_cart_rounded),
                        label: const Text('Add to bag'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Catalog',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            tooltip: 'Your bag',
            onPressed: _showBag,
            icon: Badge(
              isLabelVisible: _bagCount > 0,
              label: Text('$_bagCount'),
              child: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: AppBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
            children: [
              _buildHero(),
              const SizedBox(height: 20),
              _buildSearch(),
              const SizedBox(height: 18),
              _buildQuickStats(),
              const SizedBox(height: 22),
              _buildCatalogTabs(),
              const SizedBox(height: 20),
              _buildCategorySelector(),
              const SizedBox(height: 20),
              _buildResultsHeader(filtered.length),
              const SizedBox(height: 13),
              if (filtered.isEmpty)
                _buildEmptyState()
              else if (_gridView)
                _buildGrid(filtered)
              else
                _buildList(filtered),
              const SizedBox(height: 18),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      padding: const EdgeInsets.all(21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF372660),
            Color(0xFF24243F),
            Color(0xFF143541),
          ],
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.09),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.auto_awesome_rounded,
                  color: AppColors.cyan,
                  size: 14,
                ),
                SizedBox(width: 6),
                Text(
                  'YOUR BRAND COLLECTION',
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Products that tell\nyour brand story.',
            style: TextStyle(
              fontSize: 27,
              height: 1.15,
              letterSpacing: -0.5,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 9),
          const Text(
            'Explore your products, organize collections, '
                'and discover items to feature in your next campaign.',
            style: TextStyle(
              color: Color(0xFFD0D5E7),
              fontSize: 11.5,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _heroMetric(
                Icons.inventory_2_outlined,
                '${_products.length} products',
              ),
              const SizedBox(width: 9),
              _heroMetric(
                Icons.favorite_border_rounded,
                '${_favorites.length} favorites',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heroMetric(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 11,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.cyan, size: 17),
            const SizedBox(width: 7),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return TextField(
      controller: _search,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        hintText: 'Search name, category, or tag...',
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: _search.text.isEmpty
            ? null
            : IconButton(
          onPressed: () {
            _search.clear();
            setState(() {});
          },
          icon: const Icon(Icons.close_rounded),
        ),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.purple,
            width: 1.4,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickStats() {
    final saleCount = _products
        .where((product) => product.oldPrice > product.price)
        .length;

    return Row(
      children: [
        Expanded(
          child: _statCard(
            'Total products',
            '${_products.length}',
            Icons.inventory_2_outlined,
            AppColors.cyan,
          ),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: _statCard(
            'On sale',
            '$saleCount',
            Icons.local_offer_outlined,
            AppColors.orange,
          ),
        ),
        const SizedBox(width: 9),
        Expanded(
          child: _statCard(
            'Favorites',
            '${_favorites.length}',
            Icons.favorite_border_rounded,
            AppColors.pink,
          ),
        ),
      ],
    );
  }

  Widget _statCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 19),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 9.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCatalogTabs() {
    final tabs = ['All products', 'Favorites', 'On sale'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.map((tab) {
          final selected = _selectedTab == tab;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(tab),
              selected: selected,
              showCheckmark: false,
              onSelected: (_) {
                setState(() => _selectedTab = tab);
              },
              labelStyle: TextStyle(
                color: selected ? Colors.white : AppColors.muted,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
              selectedColor: AppColors.purple,
              backgroundColor: AppColors.surface,
              side: BorderSide(
                color: selected ? AppColors.purple : AppColors.border,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 11),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _categories.map((category) {
              final selected = _category == category;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(category),
                  selected: selected,
                  showCheckmark: false,
                  onSelected: (_) {
                    setState(() => _category = category);
                  },
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : AppColors.muted,
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                  ),
                  selectedColor: AppColors.cyan.withValues(alpha: 0.25),
                  backgroundColor: AppColors.surface,
                  side: BorderSide(
                    color: selected ? AppColors.cyan : AppColors.border,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildResultsHeader(int count) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Explore products',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$count products found',
                style: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 10.5,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _sortBy,
              isDense: true,
              dropdownColor: AppColors.surface,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 17,
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Featured',
                  child: Text('Featured'),
                ),
                DropdownMenuItem(
                  value: 'Price: Low to High',
                  child: Text('Price: Low to High'),
                ),
                DropdownMenuItem(
                  value: 'Price: High to Low',
                  child: Text('Price: High to Low'),
                ),
                DropdownMenuItem(
                  value: 'Top Rated',
                  child: Text('Top Rated'),
                ),
                DropdownMenuItem(
                  value: 'Name: A to Z',
                  child: Text('Name: A to Z'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => _sortBy = value);
                }
              },
            ),
          ),
        ),
        const SizedBox(width: 6),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: IconButton(
            visualDensity: VisualDensity.compact,
            tooltip: _gridView ? 'List view' : 'Grid view',
            onPressed: () {
              setState(() => _gridView = !_gridView);
            },
            icon: Icon(
              _gridView
                  ? Icons.view_list_rounded
                  : Icons.grid_view_rounded,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGrid(List<_Product> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 11,
        mainAxisSpacing: 12,
        childAspectRatio: 0.56,
      ),
      itemBuilder: (context, index) {
        return _buildProductCard(products[index]);
      },
    );
  }

  Widget _buildProductCard(_Product product) {
    final favorite = _favorites.contains(product.id);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => _showProductDetails(product),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      product.color.withValues(alpha: 0.20),
                      AppColors.background2,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        product.icon,
                        color: product.color,
                        size: 61,
                      ),
                    ),
                    Positioned(
                      top: 9,
                      left: 8,
                      child: _badge(product.badge, product.color),
                    ),
                    Positioned(
                      top: 3,
                      right: 2,
                      child: IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () => _toggleFavorite(product),
                        icon: Icon(
                          favorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          size: 19,
                          color: favorite
                              ? AppColors.pink
                              : AppColors.text,
                        ),
                      ),
                    ),
                    if (_discount(product) > 0)
                      Positioned(
                        bottom: 9,
                        left: 8,
                        child: _badge(
                          '${_discount(product)}% OFF',
                          AppColors.green,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11, 10, 11, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 9,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 13,
                          color: AppColors.orange,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${product.rating}',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${product.reviews} reviews',
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _currency(product.price),
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: AppColors.cyan,
                            ),
                          ),
                        ),
                        if (product.oldPrice > product.price)
                          Flexible(
                            child: Text(
                              _currency(product.oldPrice),
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 9,
                                color: AppColors.muted,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 34,
                      child: ElevatedButton(
                        onPressed: () => _addToBag(product),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          AppColors.purple.withValues(alpha: 0.20),
                          foregroundColor: AppColors.text,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 14,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Add to bag',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<_Product> products) {
    return Column(
      children: products.map((product) {
        final favorite = _favorites.contains(product.id);

        return InkWell(
          borderRadius: BorderRadius.circular(19),
          onTap: () => _showProductDetails(product),
          child: Container(
            margin: const EdgeInsets.only(bottom: 11),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(19),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                _productIcon(product, size: 76),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.category.toUpperCase(),
                        style: TextStyle(
                          color: product.color,
                          fontSize: 9,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: AppColors.orange,
                            size: 15,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${product.rating} · ${product.reviews} reviews',
                            style: const TextStyle(
                              color: AppColors.muted,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _currency(product.price),
                        style: const TextStyle(
                          color: AppColors.cyan,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () => _toggleFavorite(product),
                      icon: Icon(
                        favorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: favorite ? AppColors.pink : AppColors.muted,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () => _addToBag(product),
                      icon: const Icon(
                        Icons.add_shopping_cart_rounded,
                        color: AppColors.cyan,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _productIcon(_Product product, {double size = 52}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: product.color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        product.icon,
        color: product.color,
        size: size * 0.48,
      ),
    );
  }

  Widget _badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: color.withValues(alpha: 0.25),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 8,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.search_off_rounded,
            size: 43,
            color: AppColors.muted,
          ),
          const SizedBox(height: 12),
          const Text(
            'No products found',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Try a different search or category.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.muted,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 15),
          OutlinedButton.icon(
            onPressed: () {
              setState(() {
                _search.clear();
                _category = 'All';
                _selectedTab = 'All products';
              });
            },
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Reset filters'),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          'BRANDBOOST AI  ·  DEMO PRODUCT CATALOG',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 9,
            letterSpacing: 1.1,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _Product {
  final String id;
  final String name;
  final String category;
  final int price;
  final int oldPrice;
  final double rating;
  final int reviews;
  final String badge;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> tags;

  const _Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.reviews,
    required this.badge,
    required this.description,
    required this.icon,
    required this.color,
    required this.tags,
  });
}