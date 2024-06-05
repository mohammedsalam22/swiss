import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Introduction',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to the Red Crescent\'s website and services. By accessing or using our services, you agree to comply with and be bound by these Terms and Conditions. Please read them carefully. If you do not agree with these terms, you should not use our services.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Use of Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Eligibility\n'
                  'You must be at least 18 years old to use our services. By using our services, you represent and warrant that you are 18 or older.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Account Registration\n'
                  'To access certain features, you may need to create an account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'User Conduct\n'
                  'You agree not to use our services for any unlawful purpose or in any way that could harm the Red Crescent or its partners. You must not impersonate any person or entity or falsely state or otherwise misrepresent your affiliation with a person or entity.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Donations and Payments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Donations\n'
                  'Donations to the Red Crescent are voluntary. By making a donation, you confirm that the funds are your own, or you have authorization from the rightful owner to use these funds for this purpose.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Refunds\n'
                  'Donations are generally non-refundable. However, if you believe that an error has been made in connection with your donation, please contact us promptly.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Receipts\n'
                  'A receipt will be provided for each donation. Please retain the receipt for your records.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Privacy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Data Collection\n'
                  'We collect and use personal information in accordance with our Privacy Policy. By using our services, you consent to such collection and use.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Data Security\n'
                  'We take reasonable measures to protect your personal information from unauthorized access, use, or disclosure.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Intellectual Property',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Ownership\n'
                  'All content on our website, including text, graphics, logos, and images, is the property of the Red Crescent or its licensors and is protected by copyright and other intellectual property laws.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Use of Content\n'
                  'You may not use, reproduce, or distribute any content from our website without our prior written permission.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Limitation of Liability',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Disclaimer\n'
                  'Our services are provided "as is" without warranties of any kind, either express or implied. We do not warrant that our services will be uninterrupted or error-free.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Liability\n'
                  'In no event shall the Red Crescent be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or related to your use of our services.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Changes to Terms',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Modification\n'
                  'We reserve the right to modify these Terms and Conditions at any time. We will notify you of any changes by posting the new Terms and Conditions on our website. Your continued use of our services after any such changes constitutes your acceptance of the new Terms and Conditions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Governing Law',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Jurisdiction\n'
                  'These Terms and Conditions are governed by and construed in accordance with the laws of [Your Country]. Any disputes arising out of or in connection with these Terms and Conditions shall be subject to the exclusive jurisdiction of the courts of [Your Country].',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions about these Terms and Conditions, please contact us at:\n\n'
                  'Red Crescent\n'
                  '[Your Address]\n'
                  '[City, Country]\n'
                  'Email: [Your Email Address]\n'
                  'Phone: [Your Phone Number]',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


