//order,next2,next3 is function name
function order(){
    // alert is used to give important pop-up message
    alert("Sorry,currently online service is not available")
}
// function next1(){
//     // image1 is variable which point element that have id="id46"
//       // document.getElementById is Document Object Module(DOM) method to point html code with id
//     var image1=document.getElementById("id46");
//    // src.match check wheter the string at src matches or not
//     if(image1.src.match("./homepagephoto/bonsai1.jpg")){
//         image1.src="./homepagephoto/bonsai20.jpg";
//     }
//     else{
//         image1.src="./homepagephoto/bonsai1.jpg";
//     }
// }

function next2(){
     /* image2 is variable which point element that have id="id47"
     document.getElementById is Document Object Module(DOM) method to point html code with id*/
    var image2=document.getElementById("id47");
    // src.match check wheter the string at src matches or not
    if(image2.src.match("./homepagephoto/bonsai10.jpg")){
        image2.src="./homepagephoto/bonsai21.jpg";
    }
    else{
        image2.src="./homepagephoto/bonsai10.jpg";
    }
}
function next3(){
     /* image2 is variable which point element that have id="id48"
     document.getElementById is Document Object Module(DOM) method to point html code with id*/
    var image3=document.getElementById("id48");
     // src.match check wheter the string at src matches or not

    if(image3.src.match("./homepagephoto/bonsai4.jpg")){
        image3.src="./homepagephoto/bonsai22.jpg";
    }
    else{
        image3.src="./homepagephoto/bonsai4.jpg";
    }
}
