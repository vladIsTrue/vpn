

    Build and deploy QtApplication.framework

    /path/to/qtbase/bin/qmake && make && /path/to/qtbase/bin/macdeployqt QtApplication.framework -deploy-framework


    после чего добавить в Build Phases QtApplication.framework 

    добавить с сборку 

    Build Setting -> Swift Compiler - Code Generation -> Objective C Bridging Header: QtSwiftBridge





































g-Header.h
