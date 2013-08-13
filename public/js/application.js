$(document).ready(function(){
  var winner = '';
  var p1 = 0;
  var p2 = 0;
  var p1wins = 0;
  var p2wins = 0;

  
  
    $(document).keyup(function(e) {

      if (e.keyCode == 81){
        $(".racer_table  #player1_strip").prepend("<td></td>");
        p1++;
      }
      else if(e.keyCode == 80){
        $(".racer_table  #player2_strip").prepend("<td></td>");
        p2++;
      }

      won();

    });
  
    function won(){

    if (p1 == 9) {
      p1wins++;
      reset();
    } else if (p2 == 9){
      p2wins++;
      reset();
    }

    function reset() {
      $('.racer_table tr td:not(:last-child)').remove();
      p1 = 0;
      p2 = 0;
      champ();
    }

    function champ() {
      var randomColor = Math.floor(Math.random()*16777215).toString(16);
      $('#p1score').replaceWith("<td id='p1score'><font color="+randomColor+">"+p1wins+"</font></td>");
      var randomColor = Math.floor(Math.random()*16777215).toString(16);
      $('#p2score').replaceWith("<td id='p2score'><font color="+randomColor+">"+p2wins+"</font></td>");
    }
}

});
