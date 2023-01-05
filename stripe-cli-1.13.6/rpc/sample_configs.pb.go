// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.0
// 	protoc        v3.21.2
// source: sample_configs.proto

package rpc

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type SampleConfigsRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// Name of the sample, e.g. accept-a-card-payment
	SampleName string `protobuf:"bytes,1,opt,name=sample_name,json=sampleName,proto3" json:"sample_name,omitempty"`
}

func (x *SampleConfigsRequest) Reset() {
	*x = SampleConfigsRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_sample_configs_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SampleConfigsRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SampleConfigsRequest) ProtoMessage() {}

func (x *SampleConfigsRequest) ProtoReflect() protoreflect.Message {
	mi := &file_sample_configs_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SampleConfigsRequest.ProtoReflect.Descriptor instead.
func (*SampleConfigsRequest) Descriptor() ([]byte, []int) {
	return file_sample_configs_proto_rawDescGZIP(), []int{0}
}

func (x *SampleConfigsRequest) GetSampleName() string {
	if x != nil {
		return x.SampleName
	}
	return ""
}

type SampleConfigsResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// List of available integrations for this sample, e.g. the "accept-a-card-payment" sample
	// includes an integration that uses webhooks, a web client, and a node server.
	Integrations []*SampleConfigsResponse_Integration `protobuf:"bytes,1,rep,name=integrations,proto3" json:"integrations,omitempty"`
}

func (x *SampleConfigsResponse) Reset() {
	*x = SampleConfigsResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_sample_configs_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SampleConfigsResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SampleConfigsResponse) ProtoMessage() {}

func (x *SampleConfigsResponse) ProtoReflect() protoreflect.Message {
	mi := &file_sample_configs_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SampleConfigsResponse.ProtoReflect.Descriptor instead.
func (*SampleConfigsResponse) Descriptor() ([]byte, []int) {
	return file_sample_configs_proto_rawDescGZIP(), []int{1}
}

func (x *SampleConfigsResponse) GetIntegrations() []*SampleConfigsResponse_Integration {
	if x != nil {
		return x.Integrations
	}
	return nil
}

type SampleConfigsResponse_Integration struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	// Name of an available integration for this sample, e.g. "using-webhooks"
	IntegrationName string `protobuf:"bytes,1,opt,name=integration_name,json=integrationName,proto3" json:"integration_name,omitempty"`
	// List of available languages or platforms for the sample client, e.g. ["web", "android", "ios"]
	Clients []string `protobuf:"bytes,2,rep,name=clients,proto3" json:"clients,omitempty"`
	// List of available languages or platforms for the sample server, e.g. ["java", "node"]
	Servers []string `protobuf:"bytes,3,rep,name=servers,proto3" json:"servers,omitempty"`
}

func (x *SampleConfigsResponse_Integration) Reset() {
	*x = SampleConfigsResponse_Integration{}
	if protoimpl.UnsafeEnabled {
		mi := &file_sample_configs_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SampleConfigsResponse_Integration) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SampleConfigsResponse_Integration) ProtoMessage() {}

func (x *SampleConfigsResponse_Integration) ProtoReflect() protoreflect.Message {
	mi := &file_sample_configs_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SampleConfigsResponse_Integration.ProtoReflect.Descriptor instead.
func (*SampleConfigsResponse_Integration) Descriptor() ([]byte, []int) {
	return file_sample_configs_proto_rawDescGZIP(), []int{1, 0}
}

func (x *SampleConfigsResponse_Integration) GetIntegrationName() string {
	if x != nil {
		return x.IntegrationName
	}
	return ""
}

func (x *SampleConfigsResponse_Integration) GetClients() []string {
	if x != nil {
		return x.Clients
	}
	return nil
}

func (x *SampleConfigsResponse_Integration) GetServers() []string {
	if x != nil {
		return x.Servers
	}
	return nil
}

var File_sample_configs_proto protoreflect.FileDescriptor

var file_sample_configs_proto_rawDesc = []byte{
	0x0a, 0x14, 0x73, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x5f, 0x63, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x73,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x03, 0x72, 0x70, 0x63, 0x22, 0x37, 0x0a, 0x14, 0x53,
	0x61, 0x6d, 0x70, 0x6c, 0x65, 0x43, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x73, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x12, 0x1f, 0x0a, 0x0b, 0x73, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x5f, 0x6e, 0x61,
	0x6d, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0a, 0x73, 0x61, 0x6d, 0x70, 0x6c, 0x65,
	0x4e, 0x61, 0x6d, 0x65, 0x22, 0xd1, 0x01, 0x0a, 0x15, 0x53, 0x61, 0x6d, 0x70, 0x6c, 0x65, 0x43,
	0x6f, 0x6e, 0x66, 0x69, 0x67, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x4a,
	0x0a, 0x0c, 0x69, 0x6e, 0x74, 0x65, 0x67, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x18, 0x01,
	0x20, 0x03, 0x28, 0x0b, 0x32, 0x26, 0x2e, 0x72, 0x70, 0x63, 0x2e, 0x53, 0x61, 0x6d, 0x70, 0x6c,
	0x65, 0x43, 0x6f, 0x6e, 0x66, 0x69, 0x67, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x2e, 0x49, 0x6e, 0x74, 0x65, 0x67, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x0c, 0x69, 0x6e,
	0x74, 0x65, 0x67, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x1a, 0x6c, 0x0a, 0x0b, 0x49, 0x6e,
	0x74, 0x65, 0x67, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x12, 0x29, 0x0a, 0x10, 0x69, 0x6e, 0x74,
	0x65, 0x67, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x5f, 0x6e, 0x61, 0x6d, 0x65, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x0f, 0x69, 0x6e, 0x74, 0x65, 0x67, 0x72, 0x61, 0x74, 0x69, 0x6f, 0x6e,
	0x4e, 0x61, 0x6d, 0x65, 0x12, 0x18, 0x0a, 0x07, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x73, 0x18,
	0x02, 0x20, 0x03, 0x28, 0x09, 0x52, 0x07, 0x63, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x73, 0x12, 0x18,
	0x0a, 0x07, 0x73, 0x65, 0x72, 0x76, 0x65, 0x72, 0x73, 0x18, 0x03, 0x20, 0x03, 0x28, 0x09, 0x52,
	0x07, 0x73, 0x65, 0x72, 0x76, 0x65, 0x72, 0x73, 0x42, 0x22, 0x5a, 0x20, 0x67, 0x69, 0x74, 0x68,
	0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x73, 0x74, 0x72, 0x69, 0x70, 0x65, 0x2f, 0x73, 0x74,
	0x72, 0x69, 0x70, 0x65, 0x2d, 0x63, 0x6c, 0x69, 0x2f, 0x72, 0x70, 0x63, 0x62, 0x06, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_sample_configs_proto_rawDescOnce sync.Once
	file_sample_configs_proto_rawDescData = file_sample_configs_proto_rawDesc
)

func file_sample_configs_proto_rawDescGZIP() []byte {
	file_sample_configs_proto_rawDescOnce.Do(func() {
		file_sample_configs_proto_rawDescData = protoimpl.X.CompressGZIP(file_sample_configs_proto_rawDescData)
	})
	return file_sample_configs_proto_rawDescData
}

var file_sample_configs_proto_msgTypes = make([]protoimpl.MessageInfo, 3)
var file_sample_configs_proto_goTypes = []interface{}{
	(*SampleConfigsRequest)(nil),              // 0: rpc.SampleConfigsRequest
	(*SampleConfigsResponse)(nil),             // 1: rpc.SampleConfigsResponse
	(*SampleConfigsResponse_Integration)(nil), // 2: rpc.SampleConfigsResponse.Integration
}
var file_sample_configs_proto_depIdxs = []int32{
	2, // 0: rpc.SampleConfigsResponse.integrations:type_name -> rpc.SampleConfigsResponse.Integration
	1, // [1:1] is the sub-list for method output_type
	1, // [1:1] is the sub-list for method input_type
	1, // [1:1] is the sub-list for extension type_name
	1, // [1:1] is the sub-list for extension extendee
	0, // [0:1] is the sub-list for field type_name
}

func init() { file_sample_configs_proto_init() }
func file_sample_configs_proto_init() {
	if File_sample_configs_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_sample_configs_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SampleConfigsRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_sample_configs_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SampleConfigsResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_sample_configs_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SampleConfigsResponse_Integration); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_sample_configs_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   3,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_sample_configs_proto_goTypes,
		DependencyIndexes: file_sample_configs_proto_depIdxs,
		MessageInfos:      file_sample_configs_proto_msgTypes,
	}.Build()
	File_sample_configs_proto = out.File
	file_sample_configs_proto_rawDesc = nil
	file_sample_configs_proto_goTypes = nil
	file_sample_configs_proto_depIdxs = nil
}