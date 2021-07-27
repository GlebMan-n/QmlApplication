#include "controller.h"
#include "pillsmodel.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "devicesmodel.h"
#include "prescriptionmodel.h"
#include "databaseworker.h"
#include "autodosingsch.h"
#include "utilites.h"

#include "database.h"
#include "canisters.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);




    qmlRegisterSingletonType(QUrl("qrc:/qml/custom/table_control/BinsModel.qml"), "BinsModel", 1, 0, "BinsModel");
    qmlRegisterSingletonType(QUrl("qrc:/qml/custom/Canister/TestModel.qml"), "TestModel", 1, 0, "TestModel");
    QGuiApplication app(argc, argv);

    qmlRegisterType<DevicesModel>("Devices", 1, 0, "DevicesModel");
    qmlRegisterType<PrescriptionModel>("Prescriptions", 1, 0, "PrescriptionModel");
    qmlRegisterType<AutoDosingSch>("AutoDosingS", 1, 0, "AutoDosingSch");
    qmlRegisterType<Utilites>("com.mycompany.utilites", 1, 0, "Utilites");

    qmlRegisterUncreatableType<DatabaseWorker>("Database", 1, 0, "DatabaseWorker",
        QStringLiteral("DatabaseWorker should not be created in QML"));

    PillsModel::registerObject();

    QQmlApplicationEngine engine;

    DataBase db;
    engine.rootContext()->setContextProperty(QStringLiteral("DataBase"), &db);

    DatabaseWorker databaseWorker;
    engine.rootContext()->setContextProperty(QStringLiteral("databaseWorker"), &databaseWorker);

    Canisters canisters;
    engine.rootContext()->setContextProperty(QStringLiteral("Canisters"), &canisters);

    QQmlContext *context = engine.rootContext();
    if (nullptr != context) {
        Controller *controller = new Controller();
        context->setContextProperty(controller->objectName(), controller);
    }

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl) {
            QCoreApplication::exit(-1);
        }
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
