#ifndef __VALIDATOR_H_
#define __VALIDATOR_H_
#include <QValidator>
#include "config.h"

class CjValidator : public QValidator
{
    Q_OBJECT
public:
    CjValidator(QObject *parent = nullptr) : QValidator(parent) {}

public:
    QValidator::State validate(QString &input, int &pos) const
    {
        return QValidator::State::Invalid;
    }
};

#endif