pipeline {
  agent any
  stages {
    stage("run frontend"){
      steps {
        echo 'executing yarn...'
	      nodejs('Node14LTS'){
          sh 'yarn list'
		      sh 'yarn global list'
		  }  
    }
    stage("run backend"){
      steps {
		    echo 'executing gradle...'
		    withGradle(){
		      sh './gradlew -v'
       }
      }
    }
  }
}
