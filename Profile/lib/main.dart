import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
            home: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Data yang bisa diubah
  String nama = "Muhammad Rio Prasetiawan";
  String keterangan = "Informasi";
  String email = "rio123@gmail.com";
  String telepon = "081369696969";
  String alamat = "JL Bikini Bottom";
  
  // Data Pribadi
  String tanggalLahir = "17 Agustus 1945";
  String alamatLengkap = "JL Bikini Bottom No 45";
  String jenisKelamin = "Laki-laki";
  String kewarganegaraan = "Indonesia";
  String status = "Belum Menikah";

  // Data Pendidikan
  List<Map<String, String>> pendidikan = [
    {"jenjang": "SD ", "tahun": "(2010 - 2016)"},
    {"jenjang": "SMP ", "tahun": "(2016 - 2019)"},
    {"jenjang": "SMA ", "tahun": "(2019 - 2022)"},
  ];

  // Data Pengalaman
  List<String> pengalaman = [
    "Juara 1 Turnamen ML",
    "Ketua OSIS SMA",
    "Magang sebagai karyawan di PT Telkomsel",
  ];

  // Data Keahlian
  List<String> keahlian = [
    "Jago Mancing",
    "Ngoding Bisa Tapi Tidak Pro",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildContent(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEditDialog(context);
        },
        child: Icon(Icons.edit),
        backgroundColor: Colors.teal,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2E8B8B),
            Color(0xFF4A9B9B),
            Color(0xFF66AAAA),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 600;
              
              return isWide 
                ? _buildWideHeader() 
                : _buildNarrowHeader();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWideHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                keterangan,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),
              _buildContactInfo(),
            ],
          ),
        ),
        SizedBox(width: 40),
        Expanded(
          flex: 1,
          child: _buildProfileImage(),
        ),
      ],
    );
  }

  Widget _buildNarrowHeader() {
    return Column(
      children: [
        _buildProfileImage(),
        SizedBox(height: 20),
        Text(
          nama,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          keterangan,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/rio.jpg', // Ganti dengan nama file gambar Anda
          width: 200,
          height: 200,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Jika gambar tidak ditemukan, tampilkan placeholder
            return Container(
              color: Colors.grey[400],
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.grey[600],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactItem(Icons.email, email),
        SizedBox(height: 8),
        _buildContactItem(Icons.phone, telepon),
        SizedBox(height: 8),
        _buildContactItem(Icons.location_on, alamat),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 800;
          
          return isWide 
            ? _buildWideContent() 
            : _buildNarrowContent();
        },
      ),
    );
  }

  Widget _buildWideContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: _buildDataPribadi(),
        ),
        SizedBox(width: 40),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _buildPendidikan(),
              SizedBox(height: 30),
              _buildPengalaman(),
              SizedBox(height: 30),
              _buildKeahlian(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowContent() {
    return Column(
      children: [
        _buildDataPribadi(),
        SizedBox(height: 30),
        _buildPendidikan(),
        SizedBox(height: 30),
        _buildPengalaman(),
        SizedBox(height: 30),
        _buildKeahlian(),
      ],
    );
  }

  Widget _buildDataPribadi() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("DATA PRIBADI"),
          SizedBox(height: 15),
          _buildDataItem("Nama", nama),
          _buildDataItem("Tanggal Lahir", tanggalLahir),
          _buildDataItem("Alamat", alamatLengkap),
          _buildDataItem("Jenis Kelamin", jenisKelamin),
          _buildDataItem("Kewarganegaraan", kewarganegaraan),
          _buildDataItem("Status", status),
        ],
      ),
    );
  }

  Widget _buildPendidikan() {
    return _buildSection(
      "PENDIDIKAN",
      Column(
        children: pendidikan.map((item) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  margin: EdgeInsets.only(top: 6, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                      children: [
                        TextSpan(
                          text: item["jenjang"]!,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: " ${item["tahun"]!}",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPengalaman() {
    return _buildSection(
      "PENGALAMAN",
      Column(
        children: pengalaman.map((item) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  margin: EdgeInsets.only(top: 6, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKeahlian() {
    return _buildSection(
      "KEAHLIAN",
      Column(
        children: keahlian.map((item) {
          return Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  margin: EdgeInsets.only(top: 6, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(title),
          SizedBox(height: 15),
          content,
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.teal.withOpacity(0.3)),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.teal[700],
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildDataItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ),
          Text(
            ": ",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Data"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: TextEditingController(text: nama),
                  decoration: InputDecoration(labelText: "Nama"),
                  onChanged: (value) => nama = value,
                ),
                TextField(
                  controller: TextEditingController(text: keterangan),
                  decoration: InputDecoration(labelText: "keterangan"),
                  onChanged: (value) => keterangan = value,
                ),
                TextField(
                  controller: TextEditingController(text: email),
                  decoration: InputDecoration(labelText: "Email"),
                  onChanged: (value) => email = value,
                ),
                TextField(
                  controller: TextEditingController(text: telepon),
                  decoration: InputDecoration(labelText: "Telepon"),
                  onChanged: (value) => telepon = value,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Batal"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Simpan"),
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}