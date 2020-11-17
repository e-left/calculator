bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

bool isSymbolLast(String exp) {
  return !isNumeric(exp.substring(exp.length - 1));
}

bool isParenLast(String exp) {
  return exp.substring(exp.length - 1) == ")";
}

String insertParen(String exp) {
  if (exp.substring(exp.length - 1) == "(") {
    return exp + "(";
  }
  if (exp.substring(exp.length - 1) == ".") {
    return exp;
  }

  int parenCounter = 0;
  for (int i = 0; i < exp.length; i++) {
    if (exp.substring(i, i + 1) == "(") {
      parenCounter++;
    }
    if (exp.substring(i, i + 1) == ")") {
      parenCounter--;
    }
  }

  if (parenCounter == 0) {
    if (!isSymbolLast(exp)) {
      return exp;
    } else {
      if (exp.substring(exp.length - 1) == ")") {
        return exp;
      }
      return exp + "(";
    }
  } else {
    if (!isSymbolLast(exp)) {
      return exp + ")";
    } else {
      if (exp.substring(exp.length - 1) == ")") {
        return exp + ")";
      }
      return exp + "(";
    }
  }
}

int returnLastNumStartingIndex(String exp) {
  int j;
  for(j = exp.length; j > 0; j--) {
    if(isNumeric(exp.substring(j - 1, j))){
      break;
    }
  }
  for(int i = j; i > 0; i--) {
     if (!isNumeric(exp.substring(i - 1, i)) && exp.substring(i - 1, i) != ".") {
       return i;
     }
  }
  return 0;
}

bool canAddPeriod(String exp) {
  int index = returnLastNumStartingIndex(exp);
  for(int i = index; i < exp.length; i++){
    if(exp.substring(i, i + 1) == ".") {
      return false;
    }
    if (!isNumeric(exp.substring(i, i + 1))) {
      break;
    }
  }
  return true;
}

String invertPol(String exp) {
  int index = returnLastNumStartingIndex(exp);
  if(index < 2) {
    return exp.substring(0, index) + "(-" + exp.substring(index);
  }

  if (exp.substring(index - 2, index) == "(-") {
    return exp.substring(0, index - 2) + exp.substring(index);
  } else {
    return exp.substring(0, index) + "(-" + exp.substring(index);
  }
}

String finalizeExp(String exp) {
  String r =  exp.replaceAll('x', '*').replaceAll("\u00F7", '/');
  return r;
}

bool validExp(String exp) {
  String finalChar = exp.substring(exp.length - 1);
  switch(finalChar) {
    case "+":{
      return false;
    }
    break;
    case "-":{
      return false;
    } 
    break;
    case "*":{
      return false;
    }
    break;
    case "/":{
      return false;
    }
    break;
    case "%":{
      return false;
    }
    break;
  } 

  int parenCounter = 0;
  for(int i = 0; i < exp.length; i++){
    String c = exp.substring(i, i + 1);
    if(c == "("){
      parenCounter++;
    }
    if(c == ")"){
      parenCounter--;
    }
  }

  if(parenCounter != 0) {
    return false;
  }

  return true;
}
