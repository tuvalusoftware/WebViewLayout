

function setDimensions ()
{

  window.labels =  ["Dog", "Cat", "Horse", "Lizard", "Frog", "Toad", "Bird"]
    window.data =  [
                    [65, 59, 90, 81, 56, 55, 40],
                    [28, 48, 40, 19, 96, 27, 100]
                   ];
    
    
}

function printData() {
    
    
    
    alert("printing")
    var oData = JSON.parse(window.json);
    
    alert(oData.glossary.title)
    
    alert("hello")
    
    
    return true;
}


function setJson(json) {
    
    
    
    alert("printing")
    var oData = JSON.parse(json);
    window.jsonData = oData
    alert("hello")
    alert(json)
    
  
 
    return true;
}
