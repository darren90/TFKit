

/*
    http://yulingtianxia.com/blog/2015/10/20/Try-to-implement-picture-browser-mode-on-webview/
 */
function setImage(){
    var imgs = document.getElementsByTagName("img");
    for (var i=0;i<imgs.length;i++){
        imgs[i].setAttribute("onClick","imageClick("+i+")");
    }
}
function imageClick(i){
    var rect = getImageRect(i);
    var url="clickgirl::"+i+"::"+rect;
    document.location = url;
}
function getImageRect(i){
    var imgs = document.getElementsByTagName("img");
    var rect;
    rect = imgs[i].getBoundingClientRect().left+"::";
    rect = rect+imgs[i].getBoundingClientRect().top+"::";
    rect = rect+imgs[i].width+"::";
    rect = rect+imgs[i].height;
    return rect;
}
function getAllImageUrl(){
    var imgs = document.getElementsByTagName("img");
    var urlArray = [];
    for (var i=0;i<imgs.length;i++){
        var src = imgs[i].src;
        if(src.length > 0){
            if(imgs[i].width > 200 && imgs[i].height > 200){
                urlArray.push(src);
            }
        }
    }
    return urlArray.toString();
}
function getImageData(i){
    var imgs = document.getElementsByTagName("img");
    var img=imgs[i];
    var canvas=document.createElement("canvas");
    var context=canvas.getContext("2d");
    canvas.width=img.width; canvas.height=img.height;
    context.drawImage(img,0,0,img.width,img.height);
    return canvas.toDataURL("image/png")
}
