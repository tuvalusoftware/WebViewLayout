

function setDimensions ()
{

    window.labels =  ["Dog", "Cat", "Horse", "Lizard", "Frog", "Toad", "Bird"];
    window.data =  [
                    [65, 59, 90, 81, 56, 55, 40],
                    [28, 48, 40, 19, 96, 27, 100]
                   ];
    window.series = ['Series A', 'Series B'];
}

function printData() {
    
    
    
    alert("printing")
    var oData = JSON.parse(window.json);
    
    alert(oData.glossary.title)
    
    alert("hello")
    
    
    return true;
}


function setJson(json) {
    window.abc =  2;
    alert(window.abc);
    var oData = JSON.parse(json);
    alert(oData)
    window.labels = oData.label
    window.data = oData.data
    window.series = oData.series
    alert("this is set json function")
    alert(json)
    
    
  
 
    return true;
}
