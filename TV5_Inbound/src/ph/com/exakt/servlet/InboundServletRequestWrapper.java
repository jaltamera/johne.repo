package ph.com.exakt.servlet;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/*
 * @author Johne
 * 
 */

public class InboundServletRequestWrapper extends HttpServletRequestWrapper {

	private static final int BUFFER_START_POSITION = 0;

	private static final int CHAR_BUFFER_LENGTH = 2046;

	private final String body;

	public InboundServletRequestWrapper(HttpServletRequest request) {
		super(request);

		StringBuilder stringBuilder = new StringBuilder();
		BufferedReader bufferedReader = null;

		try {
			InputStream inputStream = request.getInputStream();

			if (inputStream != null) {
				bufferedReader = new BufferedReader(new InputStreamReader(inputStream));

				char[] charBuffer = new char[CHAR_BUFFER_LENGTH];
				int bytesRead;

				while ((bytesRead = bufferedReader.read(charBuffer)) > -1) {
					stringBuilder.append(charBuffer, BUFFER_START_POSITION, bytesRead);
				}
			} else {
				stringBuilder.append("");
			}
		} catch (IOException ex) {
			System.out.println("InboundServletRequestWrapper error # 1: " + ex);
		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (IOException ex) {
					System.out.println("InboundServletRequestWrapper error # 2: " + ex);
				}
			}
		}

		body = stringBuilder.toString();
	}

	@Override
	public ServletInputStream getInputStream() throws IOException {
		final ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(body.getBytes());
		return new CustomServletInputStream(byteArrayInputStream);
	}

	private static class CustomServletInputStream extends ServletInputStream{

		/**
		 * byteArrayInputStream : byte buffer 
		 */
		private ByteArrayInputStream byteArrayInputStream;

		/**
		 * @param byteArrayInputStream {@link java.io.ByteArrayInputStream} object.
		 */
		CustomServletInputStream(ByteArrayInputStream byteArrayInputStream){
			this.byteArrayInputStream = byteArrayInputStream;
		}


		@Override
		public int read() throws IOException {
			return byteArrayInputStream.read();
		}

	}

}