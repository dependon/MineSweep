#include "customdialog.h"
#include "ui_customdialog.h"
#include <QMessageBox>
CustomDialog::CustomDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::CustomDialog)
{
    ui->setupUi(this);
}

CustomDialog::~CustomDialog()
{
    delete ui;
}

void CustomDialog::on_okButton_clicked()
{
    int row = ui->rowEdit->text().toInt();
    int column = ui->ColumnEdit->text().toInt();
    int mine=ui->MineEdit->text().toInt();
    if(row >50 || row<=0 || column >50 || column<=0 ||mine >2500 || row<=0 || mine > row * column){
        QMessageBox::information(this, tr("Error!"),tr("Error data"));
    }
    else{
        emit sigSetMineSweepValue(row,column,mine);
    }
    close();
}

void CustomDialog::on_cancelButton_clicked()
{
    close();
}
