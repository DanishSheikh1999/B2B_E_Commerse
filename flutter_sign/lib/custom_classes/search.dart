import 'package:flutter/material.dart';

class Search extends SearchDelegate<String>{
  Search({ String hintText,
     }) : super(
       searchFieldLabel: hintText,
       keyboardType: TextInputType.text,
       textInputAction: TextInputAction.search,
     );
  @override
  List<Widget> buildActions(BuildContext context) {
      return [IconButton(icon: Icon(Icons.cancel), onPressed: (){
        query="";
      })];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
    
     
      return IconButton(icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,), 
        onPressed: (){
          close(context, null);
        });
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // TODO: implement buildResults
      return null;
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }

}