#ifndef CUSTOMDIALOG_H
#define CUSTOMDIALOG_H

#include <QDialog>

namespace Ui {
class CustomDialog;
}

class CustomDialog : public QDialog
{
    Q_OBJECT

public:
    explicit CustomDialog(QWidget *parent = nullptr);
    ~CustomDialog();

private slots:

    void on_okButton_clicked();

    void on_cancelButton_clicked();

signals :

    void sigSetMineSweepValue(int ,int ,int );

private:
    Ui::CustomDialog *ui;
};

#endif // CUSTOMDIALOG_H
