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
    imageUrl: 'https://images.unsplash.com/photo-1680775079038-1e780cb7ea0b?w=400&auto=format&fit=crop&q=60',
  ),
  Product(
    name: 'Wireless Headphones',
    price: 3500,
    description: 'Comfortable wireless headphones with clear sound.',
    imageUrl: 'https://images.unsplash.com/photo-1545127398-14699f92334b?w=400&auto=format&fit=crop&q=60',
  ),
  Product(
    name: 'Smart Watch',
    price: 4200,
    description: 'A stylish smartwatch for your daily activities.',
    imageUrl: 'https://images.unsplash.com/photo-1614106765035-bceac4ac1911?w=400&auto=format&fit=crop&q=60',
  ),
  Product(
    name: 'Skincare Set',
    price: 1800,
    description: 'A lovely skincare set for your daily routine.',
    imageUrl: 'https://images.unsplash.com/photo-1591130901921-3f0652bb3915?w=400&auto=format&fit=crop&q=60',
  ),
  Product(
    name: 'Sneakers',
    price: 3000,
    description: 'Comfortable sneakers for everyday wear.',
    imageUrl: 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=400&auto=format&fit=crop&q=60',
  ),
];
