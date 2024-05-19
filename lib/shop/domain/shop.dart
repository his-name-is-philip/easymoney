final class Shop {
  final String name;
  final String address;
  final String description;
  final String? phone;
  final String? email;
  final String imagePath;

  Shop({
    required this.name,
    required this.address,
    required this.description,
    required this.phone,
    required this.email,
    required this.imagePath,
  })  : assert(
          phone == null || RegExp(r'^7[0-9]{10}$').hasMatch(phone),
          'Invalid phone format',
        ),
        assert(
          email == null ||
              RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z]+\.[a-zA-Z]+$').hasMatch(email),
        );
}
