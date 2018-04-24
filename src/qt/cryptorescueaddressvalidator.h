// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2018 The CryptoRescue developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef CRYPTORESCUE_QT_CRYPTORESCUEADDRESSVALIDATOR_H
#define CRYPTORESCUE_QT_CRYPTORESCUEADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class CryptoRescueAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit CryptoRescueAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** CryptoRescue address widget validator, checks for a valid cryptorescue address.
 */
class CryptoRescueAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit CryptoRescueAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // CRYPTORESCUE_QT_CRYPTORESCUEADDRESSVALIDATOR_H
