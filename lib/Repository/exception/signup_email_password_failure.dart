class SignUpWithEmailAndPasswordFailure{
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message="An Unknown error occured"]) ;

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password' :
        return const SignUpWithEmailAndPasswordFailure('Please enter Strong Password') ;
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
    }
  }
