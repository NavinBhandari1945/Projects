import 'package:cloud_firestore/cloud_firestore.dart';

class Get_p_t_q{

  Future<double> getProductTotalQuantity(String p_id) async {
    // Get a reference to the "Products" collection
    CollectionReference productsCollection = FirebaseFirestore.instance.collection('Products');

    // Get a reference to the specific document "widget"
    DocumentReference widgetDoc = productsCollection.doc(p_id);

    try {
      // Call the get() method on the document reference and wait for the result
      DocumentSnapshot documentSnapshot = await widgetDoc.get();

      if (documentSnapshot.exists) {
        // Access the field value "p_id" from the retrieved document data
        var data = documentSnapshot.data() as Map<String, dynamic>?; // Cast to Map<String, dynamic>
        var p_t_quantity = data?['p_quantity']; // Access 'p_quantity' from the map
        print('Product quantity: ${p_t_quantity}');
        print("document exists and retrieve success of P T Q");
        return double.parse(p_t_quantity.toString());
      } else {
        print('Document does not exist');
        return -1;
      }
    } catch (error) {
      print('Error retrieving document: $error');
      return -1;
    }
  }


}
