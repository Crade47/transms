package validator

import "strings"

func ValidatePrefix(s *string) bool {
	if len(*s) > 2 || len(*s) < 2 {
		return false
	}

	charArr := strings.Split(*s, "")

	_, validOpPrefix := operatorPrefix[charArr[0]]
	_, validCirclePrefix := circleName[charArr[1]]

	return (validCirclePrefix && validOpPrefix)
}
