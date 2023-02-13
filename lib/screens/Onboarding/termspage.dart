import 'package:farmadvisor/screens/Onboarding/widgets/termtext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  final list = List.generate((40), (val) => "val $val");
  final ScrollController _controller = ScrollController();
  var reachEnd = false;
  // final list = List.generate((40), (val) => "val $val");
  // final ScrollController _controller = new ScrollController();
  // var reachEnd = false;

  _listener() {
    final maxScroll = _controller.position.maxScrollExtent;
    final minScroll = _controller.position.minScrollExtent;
    if (_controller.offset >= maxScroll) {
      setState(() {
        reachEnd = true;
      });
    }
    _listener() {
      final maxScroll = _controller.position.maxScrollExtent;
      final minScroll = _controller.position.minScrollExtent;
      if (_controller.offset >= maxScroll) {
        setState(() {
          reachEnd = true;
        });
      }

      if (_controller.offset <= minScroll) {
        setState(() {
          reachEnd = false;
        });
      }
    }

    if (_controller.offset <= minScroll) {
      setState(() {
        reachEnd = false;
      });
    }
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TERMS & CONDITIONS",
          style: TextStyle(
            color: Color.fromARGB(95, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Color.fromARGB(255, 165, 176, 172),
          ),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            controller: _controller,
            scrollDirection: Axis.vertical,
            child: const TermsText(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(reachEnd
                    ? const Color(0xFF275342)
                    : const Color.fromARGB(255, 213, 223, 219)),
                foregroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 255, 255, 255)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 120))),
            onPressed: reachEnd
                ? () {
                    context.go('/signin');
                  }
                : null,
            child: const Text(
              "AGREE TO TERMS AND CONDITIONS",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            )),
        const SizedBox(height: 10)
      ]),
    );
  }
}
