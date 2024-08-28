// 일치 여부
function checkImageType(fileName) {
    let pattern = /jpg$|gif$|png$|jpeg$/i;

    return fileName.match(pattern);

}

function getFileInfo(fullName){
    let fileName, imgsrc, getLink;

    let fileLink;
	
    if(checkImageType(fullName)){
        imgsrc ="/displayFile?fileName="+fullName;
        // fileLink = fullName.substr(14);

        // let front = fullName.substr(0, 12);
		// let end = fullName.substr(14);


       // getLink  = "/displayFile?fileName="+front +end;
    }else{
        imgsrc ="resources/dist/img/file.png";
        // fileLink = fullName.substr(12);
        // getLink = "/displayFile?fileName="+fullName;
    }

    // fileName = fileLink.substr(fileLink.indexOf("_")+1);

    return imgsrc;
}