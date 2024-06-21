package validator

import "strings"

func ValidatePrefix(s *string) bool {
	if len(*s) != 2 {
		return false
	}

	charArr := strings.Split(*s, "")

	_, validOpPrefix := operatorPrefix[charArr[0]]
	_, validCirclePrefix := circleName[charArr[1]]

	return (validCirclePrefix && validOpPrefix)
}

func ValidateBankName(s *string) bool {
	if len(*s) != 6 {
		return false
	}
	_, validBankName := bankNameCode[*s]
	return validBankName

}
