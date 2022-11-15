var gall  = setInterval(galleryFun, 2000);
var inter = true;
var idx = 2;

function galleryFun(){

    $(".gallery ul").animate({
        "left":-300*idx+"px"
    },300);
    $(".g_item ul li").eq(idx-1).addClass("on").siblings().removeClass("on");
    idx++;
    if(idx> $(".gallery ul li").length-3){
        $(".gallery ul").animate({
            "left":0
        },0);
        idx=0;

    }
}

$(".gallery , .g_item").hover(function(){
    if(inter==true){
        clearInterval(gall);
        inter=false;
    }
},function(){
    if(inter==false){
        gall  = setInterval(galleryFun, 3000);
        inter=true;
    }

});

$(".g_item ul li").on('click',function(){
    $(this).addClass("on").siblings().removeClass("on");
    idx = $(this).index()+1;
    $(".gallery ul").animate({
        "left":-300*idx+"px"
    },2000);

});



// 2nd

var animationPause = 0;
/*This is used to prevent user from clicking next/prev if animation is in progress*/
jQuery(document).on("click", ".click-next", function() {
    console.log("Next Clicked");
    console.log("Animation Test");
    if (animationPause == 0) {
        animationPause = 1; //Animation is now active
        console.log("Animation Free");
        //Here we link our containers to variables. Keep track of the name of the var and the class it has here, in the function we will for example remove the class ".inView1" from var inView1, but that container will still be var inView1.
        var outsideViewBefore = jQuery(".outsideViewBefore");
        var inView1 = jQuery(".inView1");
        var inView2 = jQuery(".inView2");
        var inView3 = jQuery(".inView3");
        var inView4 = jQuery(".inView4");
        var inView5 = jQuery(".inView5");
        var outsideViewAfter = jQuery(".outsideViewAfter");

        //So we want everything to move to the left. With the first swap class, adding "outsideViewBefore" to inView1, it will get margin-left: -20%; (which is the width of each container). This transition will take 1.4s, as we defined in the css. We swap the classes of the rest of the containers, so that it will correspond to their current position.
        //        Target     AddClass            RemoveClass
        swapClass(inView1, "outsideViewBefore", "inView1");
        swapClass(inView2, "inView1", "inView2");
        swapClass(inView3, "inView2", "inView3");
        swapClass(inView4, "inView3", "inView4");
        swapClass(inView5, "inView4", "inView5");
        swapClass(outsideViewAfter, "inView5", "outsideViewAfter ");

        //This timeout function will run after 1400ms, which is the same time the animation will take to complete.
        setTimeout(function() {
            //We then remove container outsideViewBefore, and add it to the end
            outsideViewBefore.remove();
            //Here we swap the class so that it gets pushed out to the right
            swapClass(outsideViewBefore, "outsideViewAfter", "outsideViewBefore");
            //And now we put it back in at the end (off screen to the right)
            outsideViewAfter.after(outsideViewBefore);
            //Allow user to click again resetting the pause to 0. With a extra 20ms added to animation time (1400 + 20), we can be sure that the animation is over.
            setTimeout(function() {
                animationPause = 0;
            }, 20);
        }, 1000); // This 1400ms should be the same as your css transition, 1.4s.
    }
});
jQuery(document).on("click", ".click-prev", function() {
    console.log("Next Clicked");
    console.log("Animation Test");
    if (animationPause == 0) {
        animationPause = 1; //Animation is now active
        console.log("Animation Free");
        //Here we link our containers to variables. Keep track of the name of the var and the class it has here, in the function we will for example remove the class ".inView1" from var inView1, but that container will still be var inView1.
        var outsideViewBefore = jQuery(".outsideViewBefore");
        var inView1 = jQuery(".inView1");
        var inView2 = jQuery(".inView2");
        var inView3 = jQuery(".inView3");
        var inView4 = jQuery(".inView4");
        var inView5 = jQuery(".inView5");
        var outsideViewAfter = jQuery(".outsideViewAfter");

        //So we want everything to move to the left. With the first swap class, adding "outsideViewBefore" to inView1, it will get margin-left: -20%; (which is the width of each container). This transition will take 1.4s, as we defined in the css. We swap the classes of the rest of the containers, so that it will correspond to their current position.
        //        Target     AddClass            RemoveClass
        swapClass(outsideViewBefore, "inView1", "outsideViewBefore");
        swapClass(inView1, "inView2", "inView1");
        swapClass(inView2, "inView3", "inView2");
        swapClass(inView3, "inView4", "inView3");
        swapClass(inView4, "inView5", "inView4");
        swapClass(inView5, "outsideViewAfter ", "inView5");


        //This timeout function will run after 1400ms, which is the same time the animation will take to complete.
        setTimeout(function() {
            outsideViewAfter.remove();
            swapClass(outsideViewAfter, "outsideViewBefore", "outsideViewAfter");
            outsideViewBefore.before(outsideViewAfter);
            //Allow user to click again resetting the pause to 0. With a extra 20ms added to animation time (1400 + 20), we can be sure that the animation is over.
            setTimeout(function() {
                animationPause = 0;
            }, 20);
        }, 1000); // This 1400ms should be the same as your css transition, 1.4s.
    }
});

//This is simply a function to add one class to a element, and remove a different class.
function swapClass(tarEl, addC, remC) {
    tarEl.removeClass(remC);
    tarEl.addClass(addC);
}

