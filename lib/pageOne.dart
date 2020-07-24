import 'package:flutter/material.dart';
import 'package:on_boarding/data.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<SliderData> slides = List<SliderData>();

  var currentIndex = 0;
  PageController pageController = PageController();

  Widget pageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.deepPurpleAccent : Colors.lightGreen,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    slides = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return SliderTile(
            slides[index].getImage(),
            slides[index].getTitle(),
            slides[index].getDescription(),
          );
        },
      ),
      bottomSheet: currentIndex == slides.length - 1
          ? Container(
              height: 70.0,
              alignment: Alignment.center,
              color: Colors.deepPurpleAccent,
              child: Text(
                'GET STARTED NOW',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        pageController.animateToPage(2,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      child: Text(
                        'SKIP',
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        for (int i = 0; i < slides.length; i++)
                          i == currentIndex
                              ? pageIndicator(true)
                              : pageIndicator(false),
                        SizedBox(
                          width: 100.0,
                        ),
                        InkWell(
                          onTap: () {
                            pageController.animateToPage(currentIndex + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.linear);
                          },
                          child: Text(
                            'NEXT',
                            style: TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  final String imageURL, title, description;

  SliderTile(this.description, this.imageURL, this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageURL),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Text(
              description,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
