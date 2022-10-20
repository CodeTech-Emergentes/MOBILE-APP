// WARNING: Please don't edit this file. It was generated by C++/WinRT v2.0.210806.1

#pragma once
#ifndef WINRT_Windows_Storage_Streams_1_H
#define WINRT_Windows_Storage_Streams_1_H
#include "winrt/impl/Windows.Foundation.0.h"
#include "winrt/impl/Windows.Storage.Streams.0.h"
WINRT_EXPORT namespace winrt::Windows::Storage::Streams
{
    struct __declspec(empty_bases) IBuffer :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IBuffer>
    {
        IBuffer(std::nullptr_t = nullptr) noexcept {}
        IBuffer(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IBufferFactory :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IBufferFactory>
    {
        IBufferFactory(std::nullptr_t = nullptr) noexcept {}
        IBufferFactory(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IBufferStatics :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IBufferStatics>
    {
        IBufferStatics(std::nullptr_t = nullptr) noexcept {}
        IBufferStatics(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IContentTypeProvider :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IContentTypeProvider>
    {
        IContentTypeProvider(std::nullptr_t = nullptr) noexcept {}
        IContentTypeProvider(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IDataReader :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IDataReader>
    {
        IDataReader(std::nullptr_t = nullptr) noexcept {}
        IDataReader(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IDataReaderFactory :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IDataReaderFactory>
    {
        IDataReaderFactory(std::nullptr_t = nullptr) noexcept {}
        IDataReaderFactory(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IDataReaderStatics :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IDataReaderStatics>
    {
        IDataReaderStatics(std::nullptr_t = nullptr) noexcept {}
        IDataReaderStatics(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IDataWriter :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IDataWriter>
    {
        IDataWriter(std::nullptr_t = nullptr) noexcept {}
        IDataWriter(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IDataWriterFactory :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IDataWriterFactory>
    {
        IDataWriterFactory(std::nullptr_t = nullptr) noexcept {}
        IDataWriterFactory(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IFileRandomAccessStreamStatics :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IFileRandomAccessStreamStatics>
    {
        IFileRandomAccessStreamStatics(std::nullptr_t = nullptr) noexcept {}
        IFileRandomAccessStreamStatics(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IInputStream :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IInputStream>,
        impl::require<winrt::Windows::Storage::Streams::IInputStream, winrt::Windows::Foundation::IClosable>
    {
        IInputStream(std::nullptr_t = nullptr) noexcept {}
        IInputStream(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IInputStreamReference :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IInputStreamReference>
    {
        IInputStreamReference(std::nullptr_t = nullptr) noexcept {}
        IInputStreamReference(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IOutputStream :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IOutputStream>,
        impl::require<winrt::Windows::Storage::Streams::IOutputStream, winrt::Windows::Foundation::IClosable>
    {
        IOutputStream(std::nullptr_t = nullptr) noexcept {}
        IOutputStream(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IRandomAccessStream :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IRandomAccessStream>,
        impl::require<winrt::Windows::Storage::Streams::IRandomAccessStream, winrt::Windows::Foundation::IClosable, winrt::Windows::Storage::Streams::IInputStream, winrt::Windows::Storage::Streams::IOutputStream>
    {
        IRandomAccessStream(std::nullptr_t = nullptr) noexcept {}
        IRandomAccessStream(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IRandomAccessStreamReference :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IRandomAccessStreamReference>
    {
        IRandomAccessStreamReference(std::nullptr_t = nullptr) noexcept {}
        IRandomAccessStreamReference(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IRandomAccessStreamReferenceStatics :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IRandomAccessStreamReferenceStatics>
    {
        IRandomAccessStreamReferenceStatics(std::nullptr_t = nullptr) noexcept {}
        IRandomAccessStreamReferenceStatics(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IRandomAccessStreamStatics :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IRandomAccessStreamStatics>
    {
        IRandomAccessStreamStatics(std::nullptr_t = nullptr) noexcept {}
        IRandomAccessStreamStatics(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
    struct __declspec(empty_bases) IRandomAccessStreamWithContentType :
        winrt::Windows::Foundation::IInspectable,
        impl::consume_t<IRandomAccessStreamWithContentType>,
        impl::require<winrt::Windows::Storage::Streams::IRandomAccessStreamWithContentType, winrt::Windows::Foundation::IClosable, winrt::Windows::Storage::Streams::IInputStream, winrt::Windows::Storage::Streams::IOutputStream, winrt::Windows::Storage::Streams::IRandomAccessStream, winrt::Windows::Storage::Streams::IContentTypeProvider>
    {
        IRandomAccessStreamWithContentType(std::nullptr_t = nullptr) noexcept {}
        IRandomAccessStreamWithContentType(void* ptr, take_ownership_from_abi_t) noexcept : winrt::Windows::Foundation::IInspectable(ptr, take_ownership_from_abi) {}
    };
}
#endif