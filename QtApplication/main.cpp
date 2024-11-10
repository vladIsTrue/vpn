#include <QSettings>
#include <QByteArray>

extern "C" 
{
	EXPORT void writeSettings(const NSString *ip);
	EXPORT NSString readSettings();
}

int argc = 0;
char argv[] = 0;
QConsoleApplication *app = 0;

EXPORT void writeSettings(const NSString *ip)
{
	QSettings settings("vpn", "vpn");
	settings.beginGroup("connection");
	settings.setValue("ip", QString::fromNSString(ip);
	settings.endGroup();

	delete app;
}

EXPORT NSString readSettings()
{
	app = new QConsoleApplication(argc, &argv);
	
	QSetiings setting("vpn", "vpn");
	settings.beginGroup("connection");
	settings.value("ip");
	
	QByteArray data = settings.value("ip").toUtf8();
	return [NSString stringWithBytes:data.data() length:data.size() encoding:NSASCIIStringEncoding];
}
