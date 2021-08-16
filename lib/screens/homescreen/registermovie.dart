import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_list/models/movie.dart';
import 'package:movie_list/services/movieProvider.dart';
import 'package:movie_list/utils/utility.dart';

// ignore: must_be_immutable
class AddMovieList extends StatefulWidget {
  AddMovieList({Key? key, this.img64 = ""}) : super(key: key);
  String img64;

  @override
  _AddMovieListState createState() => _AddMovieListState();
}

class _AddMovieListState extends State<AddMovieList> {
  pickImage() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) async {
      widget.img64 = Utility.base64String(await value!.readAsBytes());
      setState(() {
        widget.img64 = widget.img64;
      });
    });
  }

  String? formValidator(String? vlaue) {
    return (vlaue == "") ? 'This field cannot be empty' : null;
  }

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController directorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a movie'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Center(
          child: Form(
            key: _key,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Column(
                  children: [
                    (widget.img64 == "")
                        ? Container(
                            margin: EdgeInsets.all(16),
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.yellow),
                            child: Center(
                                child: Text(
                              'No Image Selected',
                              style: TextStyle(fontSize: 13),
                            )),
                          )
                        : Container(
                            margin: EdgeInsets.all(16),
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Utility.imageFromBase64String(
                                    widget.img64)),
                          ),
                    InkWell(
                      onTap: () => pickImage(),
                      child: Text(
                        'Upload/Change',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                TextFormField(
                  controller: nameController,
                  validator: formValidator,
                  decoration: InputDecoration(hintText: 'Title'),
                ),
                TextFormField(
                  controller: directorController,
                  validator: formValidator,
                  decoration: InputDecoration(hintText: 'Director'),
                ),
                SizedBox(height: 18),
                ElevatedButton(
                    onPressed: () {
                      if (!_key.currentState!.validate()) return;
                      Movie movie = Movie();
                      movie.name = nameController.text;
                      movie.director = directorController.text;
                      MovieProvider.instance.addMovie(movie);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            )),
          ),
        ),
      ),
    );
  }
}
