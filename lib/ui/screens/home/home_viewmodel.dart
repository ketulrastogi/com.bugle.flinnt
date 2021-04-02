import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  List<String> _urls = [
    'https://lh3.googleusercontent.com/proxy/Y3FDqnwX9R3Ih8nYzyQnpu1ZTiin4A69RaX_gQgvnohPPqLaZOto9BJ87yhhreW4KVqPzvaY5NZfvHM3Or1mYEawBJ-_OB60Z2WwWc29wWD4l9y3a8c-UaG3yM5oGw',
    'https://scontent.famd1-1.fna.fbcdn.net/v/t31.18172-8/s960x960/21731795_1693091247368655_3236846416008970664_o.png?_nc_cat=103&ccb=1-3&_nc_sid=730e14&_nc_ohc=8nY86mp-8OMAX_ZQyZN&_nc_ht=scontent.famd1-1.fna&_nc_tp=30&oh=05f220c14742ef5d3ed2ecacaae86246&oe=608DB94F',
    'https://media-exp1.licdn.com/dms/image/C5612AQH0oigTGrq5hQ/article-cover_image-shrink_600_2000/0/1520151719933?e=1621468800&v=beta&t=hOgHST0cWMhr4WMj_m2cRZ9tcIJ6Vr-2AFXyyRrqJWA',
  ];

  List<String> get urls => _urls;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  setCurrentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
}
