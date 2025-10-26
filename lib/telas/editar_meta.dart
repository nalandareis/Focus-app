import 'package:flutter/material.dart';
import 'package:focus_app/telas/constants.dart'; // Importa as constantes

// --- WIDGET AUXILIAR DO CALENDÁRIO ---
class _DayCircle extends StatelessWidget {
  final String day;
  final bool completed;
  // Construtor constante para evitar o erro no main.dart
  const _DayCircle({required this.day, required this.completed}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: completed ? kButtonColor : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: kButtonColor),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: completed ? Colors.white : kButtonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// --- TELA DE EDITAR META (AGORA CHAMADA EDITARMETASCREEN) ---
// O nome desta classe agora corresponde ao que o main.dart espera
class EditarMetaScreen extends StatelessWidget { 
  // Construtor constante para evitar o erro de 'Not a constant expression'
  const EditarMetaScreen({super.key}); 

  // --- MÉTODOS AUXILIARES ---

  Widget _buildInfoCard(String text, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down, color: kButtonColor),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    // Usamos o widget auxiliar _DayCircle
    Widget _buildDayCircle(String day, bool completed) {
      // O construtor de _DayCircle agora é constante!
      return _DayCircle(day: day, completed: completed); 
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Calendário de Atividades',
            style: TextStyle(fontWeight: FontWeight.bold, color: kButtonColor),
          ),
          const SizedBox(height: 10),
          // Placeholder simples para calendário
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDayCircle('Seg', true),
              _buildDayCircle('Ter', false),
              _buildDayCircle('Qua', true),
              _buildDayCircle('Qui', false),
              _buildDayCircle('Sex', true),
              _buildDayCircle('Sáb', false),
              _buildDayCircle('Dom', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildObjectiveCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Objetivo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kButtonColor,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('5Km/semana', style: TextStyle(fontSize: 16)),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Completar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: 0.7, // 70% completo
            backgroundColor: kSecondaryColor,
            valueColor: AlwaysStoppedAnimation<Color>(kButtonColor),
            minHeight: 10,
          ),
          const SizedBox(height: 5),
          const Text(
            '3.5Km de 5Km',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
  
  // --- BUILD PRINCIPAL ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kButtonColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Correr', style: kPageTitleStyle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: kButtonColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            _buildInfoCard('Horário: 14:30', onTap: () {}),
            const SizedBox(height: 20),
            _buildCalendar(),
            const SizedBox(height: 40),
            _buildObjectiveCard(),
          ],
        ),
      ),
    );
  }
}
