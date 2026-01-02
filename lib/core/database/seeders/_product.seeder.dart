import 'package:sqflite/sqflite.dart';
import '../scripts/product_table.dart';
import '../scripts/product_image_table.dart';

class ProductSeeder {
  static Future<void> seed(Database db) async {
    final List<Map<String, dynamic>> products = [
      // --- MAKANAN (Category 1) ---
      {
        'id': 1,
        'category_id': 1,
        'name': 'Paket Lava Chicken',
        'price': 16000.0,
        'stock': 20,
        'description': 'ayam geprek dengan topping lelehan saus lava yang pedas.',
        'images': [
          'https://kedaiexpo.com/wp-content/uploads/2023/12/WhatsApp-Image-2023-12-21-at-15.14.53.jpeg',
        ],
      },
      {
        'id': 2,
        'category_id': 1,
        'name': 'Ayam Geprek Biasa',
        'price': 9000.0,
        'stock': 24,
        'description':
            'Ayam goreng tepung digeprek dengan sambal korek level sedang.',
        'images': [
          'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=500',
        ],
      },
      {
        'id': 3, 
        'category_id': 1,
        'name': 'Ayam Geprek Jumbo',
        'price': 12000.0,
        'stock': 10,
        'description':
            'Potongan ayam lebih besar dengan ekstra sambal dan pedasnya nagih.',
        'images': [
          'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=500',
        ],
      },
      {
        'id': 4, // OUT OF STOCK 1
        'category_id': 1,
        'name': 'Ayam Geprek Keju',
        'price': 18000.0,
        'stock': 0,
        'description': 'Ayam geprek dengan topping lelehan keju mozarella.',
        'images': [
          'https://plus.unsplash.com/premium_photo-1683657860968-7474e7ea2d80?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ],
      },
      {
        'id': 5,
        'category_id': 1,
        'name': 'Hot Spagetti',
        'price': 15000.0,
        'stock': 30,
        'description': 'Mie pasta dengan taburan sosis dan saus pedas yang bikin nagih.',
        'images': [
          'https://www.telegraph.co.uk/content/dam/recipes/2021/03/04/TELEMMGLPICT000252466135.jpeg?imwidth=1280&imdensity=2',
        ],
      },
      {
        'id': 6, 
        'category_id': 1,
        'name': 'Paket Ayam Geprek Hemat',
        'price': 10000.0,
        'stock': 0,
        'description': 'paket ayam geprek yang hemat, dengan tambahan nasi + es teh + ayam geprek.',
        'images': [
          'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/6d181136-ba70-4c1f-ba27-18659a8e76ed_Go-Biz_20210630_132117.jpeg',
        ],
      },
      {
        'id': 7,
        'category_id': 1,
        'name': 'Paket Ayam Geprek Jumbo',
        'price': 14000.0,
        'stock': 28,
        'description': 'paket ayam geprek dengan ukuran yang jumbo dapat dinikmati. Dengan tambahan nasi + es teh + ayam geprek jumbo.',
        'images': [
          'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/e831baba-a2d9-40d6-b37e-3c9fcab04449_Go-Biz_20251119_142626.jpeg',
        ],
      },
      // --- MINUMAN (Category 2) ---
      {
        'id': 8,
        'category_id': 2,
        'name': 'Es Teh Manis',
        'price': 5000.0,
        'stock': 50,
        'description': 'Teh manis dingin segar.',
        'images': [
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500',
        ],
      },
      {
        'id': 9, // OUT OF STOCK 2
        'category_id': 2,
        'name': 'Es Jeruk Peras',
        'price': 7000.0,
        'stock': 0,
        'description': 'Jeruk peras asli dengan gula murni.',
        'images': [
          'https://images.unsplash.com/photo-1557800636-894a64c1696f?w=500',
        ],
      },
      {
        'id': 10,
        'category_id': 2,
        'name': 'Lemon Tea Hot',
        'price': 8000.0,
        'stock': 22,
        'description': 'Teh lemon hangat untuk meredakan tenggorokan.',
        'images': [
          'https://images.unsplash.com/photo-1576092768241-dec231879fc3?w=500',
        ],
      },
      {
        'id': 11, 
        'category_id': 2,
        'name': 'Air Mineral 600ml',
        'price': 4000.0,
        'stock': 50,
        'description': 'Air mineral kemasan botol dingin.',
        'images': [
          'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/f83d30ed-afd4-4aa1-9848-f8ad4778ef7c_Go-Food-Merchant_20250423_201608.jpeg',
        ],
      },
    ];

    for (var p in products) {
      await db.insert(ProductTable.tableName, {
        'id': p['id'],
        'category_id': p['category_id'],
        'name': p['name'],
        'price': p['price'],
        'stock': p['stock'], // Added stock column
        'description': p['description'],
      });

      for (var i = 0; i < p['images'].length; i++) {
        await db.insert(ProductImageTable.tableName, {
          'product_id': p['id'],
          'path': p['images'][i],
          'is_thumbnail': i == 0 ? 1 : 0,
        });
      }
    }
  }
}
