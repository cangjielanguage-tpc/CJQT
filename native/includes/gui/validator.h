#ifndef __VALIDATOR_H_
#define __VALIDATOR_H_
#include <QValidator>
#include "config.h"

class CjValidator : public QValidator
{
public:
    CjValidator(QObject *parent = nullptr) : QValidator(parent) {}

public:
    virtual QValidator::State validate(QString &input, int &pos) const
    {
        input;
        pos;
        return QValidator::State::Invalid;
    };
};

#endif