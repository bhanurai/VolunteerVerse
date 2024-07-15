import 'package:flutter/material.dart';
import 'package:volunteer_verse/features/home/donation/khalti/khalti_page.dart';

class DonationOption2 extends StatefulWidget {
  @override
  _DonationOption2State createState() => _DonationOption2State();
}

class _DonationOption2State extends State<DonationOption2> {
  TextEditingController _controller = TextEditingController();
  int selectedAmount = 0;

  void _setAmount(int amount) {
    setState(() {
      selectedAmount = amount;
      _controller.clear();
    });
  }

  void _setManualAmount(String amount) {
    setState(() {
      selectedAmount = int.tryParse(amount) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/homeless.jpg', height: 180),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'How Much Do You Want to Donate?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3,
                      children: <Widget>[
                        _buildAmountButton(1000),
                        _buildAmountButton(2000),
                        _buildAmountButton(3000),
                        _buildAmountButton(5000),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Or enter manually'),
                    SizedBox(height: 10),
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter amount',
                      ),
                      onChanged: _setManualAmount,
                    ),
                    SizedBox(height: 20),
                    Text('Payment method'),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KhaltiPage()),
                        );
                      },
                      child:
                          Image.asset('assets/images/khalti.png', height: 50),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountButton(int amount) {
    return ElevatedButton(
      onPressed: () => _setAmount(amount),
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedAmount == amount
            ? const Color.fromRGBO(97, 124, 181, 1)
            : Colors.grey,
      ),
      child: Text('Rs.$amount'),
    );
  }
}
