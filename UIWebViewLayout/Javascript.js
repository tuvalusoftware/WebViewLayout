




function setDimensions ()
{
    if (window.labels == null){
        
      alert("setting dimentions")
        
         window.labels =  ["Dog", "Cat", "Horse", "Lizard", "Frog", "Toad", "Bird"];
         window.data =  [
                    [65, 59, 90, 81, 56, 55, 40],
                    [28, 48, 40, 19, 96, 27, 100]
                   ];
        window.series = ['Series A', 'Series B'];
   }
    else
    {
 
        
    }
}

function printData() {
    
    
    
   
    var oData = JSON.parse(window.json);
    
   // alert(oData.glossary.title)
    
    
    
    
    return true;
}


function setJson(json) {
    
 
    var oData = JSON.parse(json);
 
 
    
    
    var scope =angular.element(document.getElementById('radar')).scope()
    
    
    scope.$apply(function(){
                 
                 
                 alert("setting on scope ")
                  scope.label[0]  = "RAT"
                 //scope.data   = oData.data
                 scope.labels[0] = "RAT"
                 scope.labels[2] = "MOUSE"
                 scope.labels[2] = "ZIBRA"
                 })
    
 
    
   
    return true;
}
