import 'package:flutter/material.dart';

class Policy extends StatelessWidget {
  const Policy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Policy and Privacy'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ExpansionTile(
                title: const Text(
                  'Introduction',
                  style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'This policy outlines the rules, guidelines, and expectations for users of the ecommerce app ("App") provided by [Company Name]. By accessing or using the App, you agree to comply with this policy. The policy applies to all users, including customers, sellers, and any other individual or entity accessing the App.',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Jannah',
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ExpansionTile(
                title: const Text(
                  'Account Creation',
                  style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Users must provide accurate and complete information during the registration processEach user may create and maintain only one account. Duplicate or fraudulent accounts are strictly prohibited.Users are responsible for maintaining the confidentiality of their login credentials and must not share them with others. Users must promptly notify [Company Name] if they suspect any unauthorized access or use of their account.',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Jannah',
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ExpansionTile(
                title: const Text(
                  'Security',
                  style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Users must not engage in any activity that compromises the security or integrity of the App.Users must not attempt to gain unauthorized access to other user accounts or the Apps systems Users must not use the App to distribute malware, viruses, or any other malicious content.'
                      ,style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Jannah',
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ExpansionTile(
                title: const Text(
                  'Product Listings ',
                  style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Sellers are responsible for providing accurate and truthful information about their products, including descriptions, prices, availability, and any other relevant details.Sellers must not list prohibited items or engage in fraudulent or deceptive practices.[El Wekala] reserves the right to remove or suspend any product listings that violate our policies'
                      ,style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Jannah',
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ExpansionTile(
                title: const Text(
                  'Transactions',
                  style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Buyers must make payments promptly and in accordance with the payment methods specified by [El wekala]Sellers must fulfill orders in a timely manner and deliver products that meet the specified standards.Buyers and sellers must communicate professionally and resolve any issues or disputes in good faith.[El Wekala] reserves the right to intervene in transactions and take appropriate actions to protect the interests of users and maintain the integrity of the App.',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Jannah',
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ExpansionTile(
                title: const Text(
                  'Privacy and Data Protection',
                  style: TextStyle(
                      fontFamily: 'Jannah',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                children: [
                  ListTile(
                    title: Text(
                '[El Wekala] is committed to protecting user privacy and personal data. Our Privacy Policy outlines how we collect, use, disclose, and protect user information. By using the App, you agree to the terms of our Privacy Policy.'
                      ,style: TextStyle(
                        color: Colors.grey[500],
                        fontFamily: 'Jannah',
                        fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
