{{- define "app.fullname" -}}
    {{ .Release.Name }}-{{ .Values.name | default .Chart.Name }}
{{- end -}}

{{- define "app.product.name" -}}
    {{ .Release.Name }}
{{- end -}}

{{- define "app.version" -}}
    {{ .Values.app.image.tag }} 
{{- end -}}

{{- define "app.labels.common" -}}
version: {{ .Chart.Version | replace "+" "_" }}
adminer: {{ .Values.app.image.tag | quote }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/name: {{ template "app.fullname" $ }}
{{- end -}}