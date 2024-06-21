package smsproto

import (
	"github.com/Crade47/transms/internal/validator"
)

type transmsServer struct {
	UnimplementedTransmsServer
}

func NewTSServer() *transmsServer {
	return &transmsServer{}
}

func (s *transmsServer) FilterSenders(request *SmsRequest, stream Transms_FilterSendersServer) error {
	for _, message := range request.Messages {

		validSenderId := validator.ValidateSenderId(&message.Address)

		if validSenderId {
			if err := stream.Send(message); err != nil {
				return err
			}
		}

	}
	return nil
}
