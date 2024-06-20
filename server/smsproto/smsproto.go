package smsproto

import "fmt"

type transmsServer struct {
	UnimplementedTransmsServer
}

func NewTSServer() *transmsServer {
	return &transmsServer{}
}

func (s *transmsServer) FilterSenders(request *SmsRequest, stream Transms_FilterSendersServer) error {
	for _, message := range request.Messages {
		fmt.Println(message)
		if err := stream.Send(&SmsMessage{
			Id:       message.Id,
			ThreadId: message.Id,
		}); err != nil {
			return err
		}
	}
	return nil
}
