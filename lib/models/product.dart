class Product {
  String name;
  double price;
  String description;
  String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

List<Product> productList = [
  Product(
    name: 'Lavender Handbag',
    price: 2500,
    description: 'A beautiful lavender handbag for everyday use.',
    imageUrl: 'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=500',
  ),
  Product(
    name: 'Wireless Headphones',
    price: 3500,
    description: 'Comfortable wireless headphones with clear sound.',
    imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500',
  ),
  Product(
    name: 'Smart Watch',
    price: 4200,
    description: 'A stylish smartwatch for your daily activities.',
    imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
  ),
  Product(
    name: 'Skincare Set',
    price: 1800,
    description: 'A lovely skincare set for your daily routine.',
    imageUrl: 'https://images.unsplash.com/photo-1608248543803-ba4f8c70ae0b?w=500',
  ),
  Product(
    name: 'Sneakers',
    price: 3000,
    description: 'Comfortable sneakers for everyday wear.',
    imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
  ),
];
