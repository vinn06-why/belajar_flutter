import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 1. Header Kartu Profil
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Pakai fallback icon dulu supaya tidak crash
                    // kalau asset gambar belum didaftarkan/tidak ada.
                    // Ganti kembali ke AssetImage setelah asset siap
                    // (lihat catatan pubspec.yaml di penjelasan).
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xFFE0E0E0),
                      child: Icon(Icons.person, size: 50, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Alvin wahyu al farichi', // Sesuaikan dengan Nama Anda
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Mahasiswa Teknologi Rekayasa Perangkat Lunak',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[700],
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 2. Kartu Informasi Detail
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    _InfoRow(icon: Icons.badge, label: 'NIM', value: '362558302110'),
                    const Divider(),
                    _InfoRow(icon: Icons.school, label: 'Prodi', value: 'TRPL'),
                    const Divider(),
                    _InfoRow(icon: Icons.email, label: 'Email', value: 'alvin@mahasiswa.poliwangi.ac.id'),
                    const Divider(),
                    _InfoRow(icon: Icons.location_on, label: 'Kampus', value: 'Politeknik Negeri Banyuwangi'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 3. Tombol Aksi Kustom
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('salam kenal temanku, terima kasih sudah berkunjung diberandaku.'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: const Icon(Icons.send),
              label: const Text('halo bang'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Pembantu untuk Baris Informasi (Reusable Component)
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}